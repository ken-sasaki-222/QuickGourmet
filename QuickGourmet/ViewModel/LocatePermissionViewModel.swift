//
//  LocatePermissionViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/14.
//

import Foundation
import SwiftUI

class LocatePermissionViewModel: NSObject, ObservableObject {
    @Published var isShowsAlert = false
    @Published var alertType: LocatePermissionAlertType = .failLocatePermission
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

    private func callRequestWhenInUse() {
        locatePermissionRepository.callRequestWhenInUse { status in
            self.tapNextPageButton(status: status)
        }
    }

    private func callStartUpdateLocation() {
        locatePermissionRepository.delegate = self
        locatePermissionRepository.callStartUpdateLocation()
    }

    func goToLocateSetting() {
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
            goToLocateSetting()
        case .denied:
            goToLocateSetting()
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
        userRepository.locatePermission = true
        alertType = .successLocatePermission
        isShowsAlert = true
    }

    func didFailUpdateLocation() {
        userRepository.locatePermission = false
        alertType = .failLocatePermission
        isShowsAlert = true
    }
}
