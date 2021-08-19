//
//  UserAuthViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/17.
//

import Foundation
import SwiftUI

class UserAuthViewModel: ObservableObject {
    @Published var userRepository = UserRepository()
    @Published var authResult: Result<Bool, Error>?

    func canLogin(_ callback: @escaping (Result<Bool, Error>) -> Void) {
        userRepository.userAuth { result in
            callback(result)
        }
    }

    func canLogout(completion: @escaping (Result<Bool, Error>) -> Void) {
        userRepository.logout { result in
            completion(result)
        }
    }
}
