//
//  AppTrackingTransparencyViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/23.
//

import Foundation

class AppTrackingTransparencyViewModel: NSObject {
    private let appTrackingTransparencyRepository: AppTrackingTransparencyRepositoryInterface

    init(appTrackingTransparencyRepository: AppTrackingTransparencyRepositoryInterface) {
        self.appTrackingTransparencyRepository = appTrackingTransparencyRepository
        super.init()
    }

    override convenience init() {
        self.init(appTrackingTransparencyRepository: RepositoryLocator.getAppTrackingTransparencyRepository())
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
            RootViewHelper.shared.changeRootView(rootView: .home)
        }
    }
}
