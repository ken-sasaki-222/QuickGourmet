//
//  UserDefaultsDataStore.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/03.
//

import Foundation

class UserDefaultsDataStore {
    enum UserDefaultsKey: String {
        case latitude
        case longitude
        case locationSaved
        case trackingPermission
        case launchCount = "launch_count"
        case shopDetailLaunchCount = "shopdetail_launchcount"
        case favoriteShopDetailLaunchCount = "favoriteshopdetail_launchcount"
        case searchListLaunchCount = "searchlist_launchcount"
        case favoriteListLaunchCount = "favoritelist_launchcount"
        case deviceId = "device_id"
    }

    var defaults: UserDefaults {
        UserDefaults.standard
    }

    var latitude: Double {
        get {
            defaults.double(forKey: UserDefaultsKey.latitude.rawValue)
        }
        set(newValue) {
            defaults.setValue(newValue, forKey: UserDefaultsKey.latitude.rawValue)
        }
    }

    var longitude: Double {
        get {
            defaults.double(forKey: UserDefaultsKey.longitude.rawValue)
        }
        set(newValue) {
            defaults.setValue(newValue, forKey: UserDefaultsKey.longitude.rawValue)
        }
    }

    var locatePermission: Bool {
        get {
            defaults.bool(forKey: UserDefaultsKey.locationSaved.rawValue)
        }
        set(newValue) {
            defaults.set(newValue, forKey: UserDefaultsKey.locationSaved.rawValue)
        }
    }

    var trackingPermission: Bool {
        get {
            defaults.bool(forKey: UserDefaultsKey.trackingPermission.rawValue)
        }
        set(newValue) {
            defaults.set(newValue, forKey: UserDefaultsKey.trackingPermission.rawValue)
        }
    }

    var launchCount: Int {
        get {
            defaults.integer(forKey: UserDefaultsKey.launchCount.rawValue)
        }
        set(newValue) {
            defaults.setValue(newValue + 1, forKey: UserDefaultsKey.launchCount.rawValue)
        }
    }

    var shopDetailLaunchCount: Int {
        get {
            defaults.integer(forKey: UserDefaultsKey.shopDetailLaunchCount.rawValue)
        }
        set(newValue) {
            defaults.setValue(newValue + 1, forKey: UserDefaultsKey.shopDetailLaunchCount.rawValue)
        }
    }

    var favoriteShopDetailLaunchCount: Int {
        get {
            defaults.integer(forKey: UserDefaultsKey.favoriteShopDetailLaunchCount.rawValue)
        }
        set(newValue) {
            defaults.setValue(newValue + 1, forKey: UserDefaultsKey.favoriteShopDetailLaunchCount.rawValue)
        }
    }

    var searchListLaunchCount: Int {
        get {
            defaults.integer(forKey: UserDefaultsKey.searchListLaunchCount.rawValue)
        }
        set(newValue) {
            defaults.setValue(newValue + 1, forKey: UserDefaultsKey.searchListLaunchCount.rawValue)
        }
    }

    var favoriteListLaunchCount: Int {
        get {
            defaults.integer(forKey: UserDefaultsKey.favoriteListLaunchCount.rawValue)
        }
        set(newValue) {
            defaults.setValue(newValue + 1, forKey: UserDefaultsKey.favoriteListLaunchCount.rawValue)
        }
    }

    var deviceId: String {
        get {
            defaults.string(forKey: UserDefaultsKey.deviceId.rawValue) ?? ""
        }
        set(newValue) {
            defaults.set(newValue, forKey: UserDefaultsKey.deviceId.rawValue)
        }
    }
}
