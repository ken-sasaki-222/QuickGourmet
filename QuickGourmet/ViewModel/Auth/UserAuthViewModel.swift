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
            self.authResult = result
            guard let authResult = self.authResult else {
                return
            }
            callback(authResult)
        }
    }
}
