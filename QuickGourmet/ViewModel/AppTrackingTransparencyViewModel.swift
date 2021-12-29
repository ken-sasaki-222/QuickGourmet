//
//  AppTrackingTransparencyViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/23.
//

import Foundation

class AppTrackingTransparencyViewModel: NSObject {
    private let appTrackingTransparencyRepository: AppTrackingTransparencyRepositoryInterface
    private var userRepository: UserRepositoryInterface

    init(appTrackingTransparencyRepository: AppTrackingTransparencyRepositoryInterface, userRepository: UserRepositoryInterface) {
        self.appTrackingTransparencyRepository = appTrackingTransparencyRepository
        self.userRepository = userRepository
        super.init()
    }

    override convenience init() {
        self.init(appTrackingTransparencyRepository: RepositoryLocator.getAppTrackingTransparencyRepository(), userRepository: RepositoryLocator.getUserRepository())
    }

    var openTrackingPermissionViewEnabled: Bool {
        let isPermission = userRepository.trackingPermission

        if !isPermission {
            return true
        } else {
            return false
        }
    }

    func getAuthorizationStatus() {
        let status = appTrackingTransparencyRepository.getAuthorizationStatus()

        if status == .notDetermined {
            requestAuthorization()
        } else {
            RootViewHelper.shared.changeRootView(rootView: .home)
        }
    }

    private func requestAuthorization() {
        appTrackingTransparencyRepository.requestAuthorization {
            self.userRepository.trackingPermission = true
            RootViewHelper.shared.changeRootView(rootView: .home)
        }
    }
}
