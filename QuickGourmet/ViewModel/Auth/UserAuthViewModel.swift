//
//  UserAuthViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/17.
//

import Foundation
import SwiftUI

class UserAuthViewModel {
    private var userRepository = UserRepository()

    func canLogin(_ callback: @escaping (Result<Bool, Error>) -> Void) {
        userRepository.login { result in
            callback(result)
        }
    }

    func canLogout(completion: @escaping (Result<Bool, Error>) -> Void) {
        userRepository.logout { result in
            completion(result)
        }
    }
}
