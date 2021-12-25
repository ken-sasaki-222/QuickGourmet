//
//  AppTrackingTransparencyRepository.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/23.
//

import AppTrackingTransparency
import Foundation

class AppTrackingTransparencyRepository: AppTrackingTransparencyRepositoryInterface {
    private let appTrackingTransparencyDataStore = AppTrackingTransparencyDataStore()

    func requestAuthorization(complication: @escaping () -> Void) {
        appTrackingTransparencyDataStore.requestAuthorization {
            complication()
        }
    }

    func getAuthorizationStatus() -> AppTrackingTransparencyStatusType {
        let status = appTrackingTransparencyDataStore.getAuthorizationStatus()
        let type = AppTrackingTransparencyStatusTranslator.translate(input: status)
        return type
    }
}
