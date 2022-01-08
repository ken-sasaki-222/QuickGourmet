//
//  LoadSettingsHelper.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2022/01/08.
//

import Foundation

class LoadSettingsHelper {
    static func getHotpepperKey() throws -> String? {
        guard let path = Bundle.main.path(forResource: "settings", ofType: "plist") else {
            return nil
        }
        let settingUrl = URL(fileURLWithPath: path)
        let data = try Data(contentsOf: settingUrl)
        let decoder = PropertyListDecoder()
        let settings = try decoder.decode(Settings.self, from: data)

        return settings.hotpepperKey
    }

    static func getNendInterstitialKey() throws -> String? {
        guard let path = Bundle.main.path(forResource: "settings", ofType: "plist") else {
            return nil
        }
        let settingUrl = URL(fileURLWithPath: path)
        let data = try Data(contentsOf: settingUrl)
        let decoder = PropertyListDecoder()
        let settings = try decoder.decode(Settings.self, from: data)

        return settings.nendInterstitialKey
    }

    static func getNendInterstitialId() throws -> Int? {
        guard let path = Bundle.main.path(forResource: "settings", ofType: "plist") else {
            return nil
        }
        let settingUrl = URL(fileURLWithPath: path)
        let data = try Data(contentsOf: settingUrl)
        let decoder = PropertyListDecoder()
        let settings = try decoder.decode(Settings.self, from: data)

        return settings.nendInterstitialId
    }
}
