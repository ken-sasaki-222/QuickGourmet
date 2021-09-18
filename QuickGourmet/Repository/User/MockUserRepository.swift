//
//  MockUserRepository.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/18.
//

import Foundation

class MockUserRepository: UserRepositoryInterface {
    let userDefaultsDataStore = UserDefaultsDataStore()
    var error: Error?
    var result: Bool?

    func login(_ completion: @escaping (Result<Bool, Error>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else {
            guard let result = result else {
                return
            }
            completion(.success(result))
        }
    }

    func logout(_ completion: @escaping (Result<Bool, Error>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else {
            guard let result = result else {
                return
            }
            completion(.success(result))
        }
    }

    var latitude: Double {
        get {
            35.646850154618406
        }
        set(newValue) {
            userDefaultsDataStore.latitudeInformation = newValue
        }
    }

    var longitude: Double {
        get {
            139.6297479552915
        }
        set(newValue) {
            userDefaultsDataStore.longitudeInformation = newValue
        }
    }

    var launchCount: Int {
        get {
            0
        }
        set(newValue) {
            userDefaultsDataStore.launchCount = newValue
        }
    }

    var searchListLaunchCount: Int {
        get {
            0
        }
        set(newValue) {
            userDefaultsDataStore.searchListLaunchCount = newValue
        }
    }

    var shopDetailLaunchCount: Int {
        get {
            0
        }
        set(newValue) {
            userDefaultsDataStore.shopDetailLaunchCount = newValue
        }
    }
    
    var favoriteListLaunchCount: Int {
        get {
            0
        }
        set(newValue) {
            userDefaultsDataStore.favoriteListLaunchCount = newValue
        }
    }

    var favoriteShopDetailLaunchCount: Int {
        get {
            0
        }
        set(newValue) {
            userDefaultsDataStore.favoriteShopDetailLaunchCount = newValue
        }
    }
}
