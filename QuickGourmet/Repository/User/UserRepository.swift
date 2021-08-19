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
        do {
            try Auth.auth().signOut()
            completion(.success(true))
        } catch {
            completion(.failure(error))
        }
    }
}
