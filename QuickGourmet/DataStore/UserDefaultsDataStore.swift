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
        case launchCount = "launch_count"
        case shopDetailLaunchCount = "shopdetail_launchcount"
        case favoriteShopDetailLaunchCount = "favoriteshopdetail_launchcount"
        case searchListLaunchCount = "searchlist_launchcount"
        case favoriteListLaunchCount = "favoritelist_launchcount"
        case deviceId = "device_id"
    }

    var defalts: UserDefaults {
        UserDefaults.standard
    }

    var latitude: Double {
        get {
            defalts.double(forKey: UserDefaultsKey.latitude.rawValue)
        }
        set(newValue) {
            defalts.setValue(newValue, forKey: UserDefaultsKey.latitude.rawValue)
        }
    }

    var longitude: Double {
        get {
            defalts.double(forKey: UserDefaultsKey.longitude.rawValue)
        }
        set(newValue) {
            defalts.setValue(newValue, forKey: UserDefaultsKey.longitude.rawValue)
        }
    }

    var launchCount: Int {
        get {
            defalts.integer(forKey: UserDefaultsKey.launchCount.rawValue)
        }
        set(newValue) {
            defalts.setValue(newValue + 1, forKey: UserDefaultsKey.launchCount.rawValue)
        }
    }

    var shopDetailLaunchCount: Int {
        get {
            defalts.integer(forKey: UserDefaultsKey.shopDetailLaunchCount.rawValue)
        }
        set(newValue) {
            defalts.setValue(newValue + 1, forKey: UserDefaultsKey.shopDetailLaunchCount.rawValue)
        }
    }

    var favoriteShopDetailLaunchCount: Int {
        get {
            defalts.integer(forKey: UserDefaultsKey.favoriteShopDetailLaunchCount.rawValue)
        }
        set(newValue) {
            defalts.setValue(newValue + 1, forKey: UserDefaultsKey.favoriteShopDetailLaunchCount.rawValue)
        }
    }

    var searchListLaunchCount: Int {
        get {
            defalts.integer(forKey: UserDefaultsKey.searchListLaunchCount.rawValue)
        }
        set(newValue) {
            defalts.setValue(newValue + 1, forKey: UserDefaultsKey.searchListLaunchCount.rawValue)
        }
    }

    var favoriteListLaunchCount: Int {
        get {
            defalts.integer(forKey: UserDefaultsKey.favoriteListLaunchCount.rawValue)
        }
        set(newValue) {
            defalts.setValue(newValue + 1, forKey: UserDefaultsKey.favoriteListLaunchCount.rawValue)
        }
    }

    var deviceId: String {
        get {
            defalts.string(forKey: UserDefaultsKey.deviceId.rawValue) ?? ""
        }
        set(newValue) {
            defalts.set(newValue, forKey: UserDefaultsKey.deviceId.rawValue)
        }
    }
}
