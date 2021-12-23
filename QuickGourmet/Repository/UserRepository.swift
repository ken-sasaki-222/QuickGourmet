//
//  UserRepository.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/18.
//

import Foundation

class UserRepository: UserRepositoryInterface {
    let userDefaultsDataStore = UserDefaultsDataStore()

    var latitude: Double {
        get {
            userDefaultsDataStore.latitude
        }
        set(newValue) {
            userDefaultsDataStore.latitude = newValue
        }
    }

    var longitude: Double {
        get {
            userDefaultsDataStore.longitude
        }
        set(newValue) {
            userDefaultsDataStore.longitude = newValue
        }
    }

    var locatePermission: Bool {
        get {
            userDefaultsDataStore.locatePermission
        }
        set(newValue) {
            userDefaultsDataStore.locatePermission = newValue
        }
    }

    var launchCount: Int {
        get {
            userDefaultsDataStore.launchCount
        }
        set(newValue) {
            userDefaultsDataStore.launchCount = newValue
        }
    }

    var searchListLaunchCount: Int {
        get {
            userDefaultsDataStore.searchListLaunchCount
        }
        set(newValue) {
            userDefaultsDataStore.searchListLaunchCount = newValue
        }
    }

    var shopDetailLaunchCount: Int {
        get {
            userDefaultsDataStore.shopDetailLaunchCount
        }
        set(newValue) {
            userDefaultsDataStore.shopDetailLaunchCount = newValue
        }
    }

    var favoriteListLaunchCount: Int {
        get {
            userDefaultsDataStore.favoriteListLaunchCount
        }
        set(newValue) {
            userDefaultsDataStore.favoriteListLaunchCount = newValue
        }
    }

    var favoriteShopDetailLaunchCount: Int {
        get {
            userDefaultsDataStore.favoriteShopDetailLaunchCount
        }
        set(newValue) {
            userDefaultsDataStore.favoriteShopDetailLaunchCount = newValue
        }
    }

    var deviceId: String {
        get {
            userDefaultsDataStore.deviceId
        }
        set(newValue) {
            userDefaultsDataStore.deviceId = newValue
        }
    }
}
