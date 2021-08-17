//
//  UserAuthViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/17.
//

import Foundation
import SwiftUI

class UserAuthViewModel {
    func isValidateAnonymity(anonymity: String) -> Bool {
        if anonymity.count >= 2 {
            return true
        } else {
            return false
        }
    }
}
