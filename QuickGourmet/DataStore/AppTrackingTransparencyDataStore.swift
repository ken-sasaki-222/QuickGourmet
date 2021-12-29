//
//  AppTrackingTransparencyDataStore.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/23.
//

import AppTrackingTransparency
import Foundation

class AppTrackingTransparencyDataStore {
    func requestAuthorization(complication: @escaping () -> Void) {
        ATTrackingManager.requestTrackingAuthorization { _ in
            complication()
        }
    }

    func getAuthorizationStatus() -> ATTrackingManager.AuthorizationStatus {
        ATTrackingManager.trackingAuthorizationStatus
    }
}
