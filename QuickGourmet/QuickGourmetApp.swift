//
//  QuickGourmetApp.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/08.
//

import CoreLocation
import SwiftUI

@main
struct QuickGourmetApp: App {
    // AppDelegateの設定を可能に
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
    }
}

// アプリの起動時に位置情報を利用できるように設定
class AppDelegate: UIResponder, UIApplicationDelegate, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest // 精度
            locationManager.distanceFilter = 10
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

        print("緯度: ", location.latitude, "経度: ", location.longitude)
    }
}
