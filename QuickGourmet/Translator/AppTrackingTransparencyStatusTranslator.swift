//
//  AppTrackingTransparencyStatusTranslator.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/25.
//

import AppTrackingTransparency
import Foundation

class AppTrackingTransparencyStatusTranslator {
    static func translate(input: ATTrackingManager.AuthorizationStatus) -> AppTrackingTransparencyStatusType {
        switch input {
        case .authorized:
            return AppTrackingTransparencyStatusType.authorized
        case .denied:
            return AppTrackingTransparencyStatusType.denied
        case .restricted:
            return AppTrackingTransparencyStatusType.restricted
        case .notDetermined:
            return AppTrackingTransparencyStatusType.notDetermined
        default:
            return AppTrackingTransparencyStatusType.unknown
        }
    }
}
