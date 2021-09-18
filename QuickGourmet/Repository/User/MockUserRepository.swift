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
}
