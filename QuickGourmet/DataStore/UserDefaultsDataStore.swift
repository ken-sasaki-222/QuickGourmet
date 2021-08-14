//
//  UserDefaultsDataStore.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/03.
//

import Foundation

class UserDefaultsDataStore {
    enum UserDefaultsKey: String {
        case latitudeInformation = "latitude_information"
        case longitudeInformation = "longitude_information"
        case shopDetailLaunchCount = "shopdetail_launchcount"
    }

    var defalts: UserDefaults {
        UserDefaults.standard
    }

    var latitudeInformation: Double {
        get {
            defalts.double(forKey: UserDefaultsKey.latitudeInformation.rawValue)
        }
        set(newValue) {
            defalts.setValue(newValue, forKey: UserDefaultsKey.latitudeInformation.rawValue)
        }
    }

    var longitudeInformation: Double {
        get {
            defalts.double(forKey: UserDefaultsKey.longitudeInformation.rawValue)
        }
        set(newValue) {
            defalts.setValue(newValue, forKey: UserDefaultsKey.longitudeInformation.rawValue)
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
}
