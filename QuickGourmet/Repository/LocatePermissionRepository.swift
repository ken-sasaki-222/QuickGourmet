//
//  LocatePermissionRepository.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/14.
//

import Foundation

protocol LocatePermissionRepositoryDelegate: AnyObject {
    func updatedLocation()
    func didFailUpdateLocation()
}

class LocatePermissionRepository: LocatePermissionRepositoryInterface {
    private let locatePermissionDataStore = LocatePermissionDataStore()
    private let userDefaultsDataStore = UserDefaultsDataStore()
    weak var delegate: LocatePermissionRepositoryDelegate?

    func getStatus() -> LocationStatusType {
        let status = locatePermissionDataStore.statusType
        return status
    }

    func callRequestWhenInUse(complication: @escaping (LocationStatusType) -> Void) {
        locatePermissionDataStore.requestWhenInUse { status in
            complication(status)
        }
    }

    func callStartUpdateLocation() {
        locatePermissionDataStore.delegate = self
        locatePermissionDataStore.startUpdateLocation()
    }
}

extension LocatePermissionRepository: LocatePermissionDataStoreDelegate {
    func updatedLocation() {
        userDefaultsDataStore.locationSaved = true

        delegate?.updatedLocation()
    }

    func didFailUpdateLocation() {
        delegate?.didFailUpdateLocation()
    }
}
