//
//  UserRepository.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/18.
//

import Firebase
import FirebaseAuth
import Foundation

class UserRepository: UserRepositoryInterface {
    let userDefaultsDataStore = UserDefaultsDataStore()

    func login(_ completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().signInAnonymously { authResult, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let user = authResult?.user else {
                return
            }
            let isAnonymous = user.isAnonymous
            completion(.success(isAnonymous))
        }
    }

    func logout(_ completion: @escaping (Result<Bool, Error>) -> Void) {
        Auth.auth().currentUser?.delete { [weak self] error in
            guard self != nil else {
                return
            }
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(true))
            }
        }
    }

    var latitude: Double {
        get {
            userDefaultsDataStore.latitudeInformation
        }
        set(newValue) {
            userDefaultsDataStore.latitudeInformation = newValue
        }
    }

    var longitude: Double {
        get {
            userDefaultsDataStore.longitudeInformation
        }
        set(newValue) {
            userDefaultsDataStore.longitudeInformation = newValue
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
