//
//  LocatePermissionViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/14.
//

import SwiftUI

class LocatePermissionViewModel: NSObject {
    private var locatePermissionRepository: LocatePermissionRepositoryInterface
    private var userRepository: UserRepositoryInterface

    init(locatePermissionRepository: LocatePermissionRepositoryInterface, userRepository: UserRepositoryInterface) {
        self.locatePermissionRepository = locatePermissionRepository
        self.userRepository = userRepository
        super.init()
    }

    override convenience init() {
        self.init(
            locatePermissionRepository: RepositoryLocator.getLocatePermissionRepository(),
            userRepository: RepositoryLocator.getUserRepository()
        )
    }

    var openLocatePermissionViewEnabled: Bool {
        let locatePermission = userRepository.locatePermission

        if !locatePermission {
            return true
        } else {
            return false
        }
    }

    func getStatus() -> LocationStatusType {
        let status = locatePermissionRepository.getStatus()
        return status
    }

    func callRequestWhenInUse() {
        locatePermissionRepository.callRequestWhenInUse { status in
            self.tapNextPageButton(status: status)
        }
    }

    func callStartUpdateLocation() {
        locatePermissionRepository.delegate = self
        locatePermissionRepository.callStartUpdateLocation()
    }

    func notAllowedAction() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else {
            return
        }

        UIApplication.shared.open(url)
    }

    func tapNextPageButton(status: LocationStatusType) {
        switch status {
        case .notDetermined:
            callRequestWhenInUse()
        case .restricted:
            notAllowedAction()
        case .denied:
            notAllowedAction()
        case .authorizedAlways:
            callStartUpdateLocation()
        case .authorizedWhenInUse:
            callStartUpdateLocation()
        case .authorized:
            callStartUpdateLocation()
        case .unknown:
            return
        }
    }
}

extension LocatePermissionViewModel: LocatePermissionRepositoryDelegate {
    func updatedLocation() {
        DispatchQueue.main.async {
            RootViewHelper.shared.changeRootView(rootView: .home)
        }
    }

    func didFailUpdateLocation() {
        print("登録失敗")
    }
}
