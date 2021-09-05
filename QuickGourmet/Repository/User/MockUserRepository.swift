//
//  MockUserRepository.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/18.
//

import Foundation

class MockUserRepository: UserRepositoryInterface {
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
}
