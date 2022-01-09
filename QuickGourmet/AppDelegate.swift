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
        recordLaunchCount()
        saveDeviceId()
        setUpNendAd()

        return true
    }

    private func setUpNendAd() {
        do {
            guard let nendKey = try LoadSettingsHelper.getNendInterstitialKey() else {
                return
            }
            guard let nendId = try LoadSettingsHelper.getNendInterstitialId() else {
                return
            }

            NADInterstitial.sharedInstance().loadAd(withSpotID: nendId, apiKey: nendKey)
        } catch {
            print("Error setup nend ad.")
            print("Error localize message.", error.localizedDescription)
        }
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
