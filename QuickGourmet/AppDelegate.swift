//
//  AppDelegate.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/22.
//

import NendAd
import SwiftUI

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
        FirebaseHelper.firebaseConfigure()
        setUpNendAd()
        recordLaunchCount()
        saveDeviceId()

        return true
    }

    private func setUpNendAd() {
        NADInterstitial.sharedInstance().loadAd(withSpotID: NEND_INTERSTITIAL_STILLNESS_SPOTID, apiKey: NEND_INTERSTITIAL_STILLNESS_AD_APIKEY)
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
}
