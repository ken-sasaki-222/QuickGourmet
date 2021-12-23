//
//  FirebaseHelper.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/23.
//

import Firebase
import Foundation

class FirebaseHelper {
    static func firebaseConfigure() {
        #if DEBUG
            let filePath = Bundle.main.path(forResource: "GoogleService-Stage-Info", ofType: "plist")
        #else
            let filePath = Bundle.main.path(forResource: "GoogleService-Info", ofType: "plist")
        #endif

        guard let filePath = filePath else {
            return
        }

        guard let options = FirebaseOptions(contentsOfFile: filePath) else {
            return
        }

        FirebaseApp.configure(options: options)
    }
}
