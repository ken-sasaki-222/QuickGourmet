//
//  QuickGourmetApp.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/08.
//

import CoreLocation
import Firebase
import FirebaseAuth
import NendAd
import SwiftUI

@main
struct QuickGourmetApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            if Auth.auth().currentUser?.uid == nil {
                LoginView()
            } else {
                TabBarView()
            }
        }
    }
}

// アプリの起動時に位置情報を利用できるように設定
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    private var userRepository: UserRepositoryInterface
    private let userDefaultsDataStore = UserDefaultsDataStore()

    init(userRepository: UserRepositoryInterface) {
        self.userRepository = userRepository
        super.init()
    }

    override convenience init() {
        self.init(userRepository: RepositoryLocator.getUserRepository())
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // インタースティシャル静止広告のロード
        NADInterstitial.sharedInstance().loadAd(withSpotID: NEND_INTERSTITIAL_STILLNESS_SPOTID, apiKey: NEND_INTERSTITIAL_STILLNESS_AD_APIKEY)
        // バナー広告のロード
        NADInterstitial.sharedInstance().loadAd(withSpotID: NEND_INTERSTITIAL_BANNER_SPOTID, apiKey: NEND_INTERSTITIAL_BANNER_AD_APIKEY)
        // Firebase共有インスタンスの作成
        FirebaseApp.configure()
        // Cloud Firestoreの初期化
        _ = Firestore.firestore()
        // 起動回数記録
        recordLaunchCount()

        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest // 精度
            locationManager.distanceFilter = 10
            locationManager.pausesLocationUpdatesAutomatically = false // ポーズしても位置取得を続ける
            locationManager.activityType = .fitness
            locationManager.startUpdatingLocation()
        }

        return true
    }

    // 位置情報に変化があった場合の処理
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else {
            return
        }

        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(
            newLocation.coordinate.latitude,
            newLocation.coordinate.longitude
        )

        userRepository.latitude = location.latitude
        userRepository.longitude = location.longitude
        print("緯度: ", location.latitude, "経度: ", location.longitude)
    }

    func recordLaunchCount() {
        userRepository.launchCount = userRepository.launchCount
    }
}
