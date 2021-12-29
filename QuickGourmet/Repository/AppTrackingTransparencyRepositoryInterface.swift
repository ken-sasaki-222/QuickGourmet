//
//  AppTrackingTransparencyRepositoryInterface.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/23.
//

import Foundation

protocol AppTrackingTransparencyRepositoryInterface {
    func requestAuthorization(complication: @escaping () -> Void)
    func getAuthorizationStatus() -> AppTrackingTransparencyStatusType
}
