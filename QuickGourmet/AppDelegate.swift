//
//  AppDelegate.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/22.
//

import SwiftUI
import NendAd
import Firebase

class AppDelegate: UIResponder, UIApplicationDelegate {
    private var userRepository: UserRepositoryInterface

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

        // 最新
        firebaseConfigure()
        recordLaunchCount()
        saveDeviceId()

        return true
    }

    private func recordLaunchCount() {
        userRepository.launchCount = userRepository.launchCount
    }

    private func saveDeviceId() {
        if let deviceId = UIDevice.current.identifierForVendor?.uuidString {
            if userRepository.deviceId == "" {
                userRepository.deviceId = deviceId
            }
        }
    }

    private func firebaseConfigure() {
        #if DEBUG
            let filePath = Bundle.main.path(forResource: "GoogleService-Stage-Info", ofType: "plist")
        #else
            let filePath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist")
        #endif

        guard let filePath = filePath else {
            return
        }

        guard let options = FirebaseOptions(contentsOfFile: filePath) else {
            return
        }

        FirebaseApp.configure(options: options)
    }
}
