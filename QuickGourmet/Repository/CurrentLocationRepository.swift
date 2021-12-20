//
//  CurrentLocationRepository.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/14.
//

import Foundation

protocol CurrentLocationRepositoryDelegate: AnyObject {
    func updatedLocation()
    func didFailUpdateLocation()
}

class CurrentLocationRepository: CurrentLocationRepositoryInterface {
    private let currentLocationDataStore = CurrentLocationDataStore()
    private let userDefaultsDataStore = UserDefaultsDataStore()
    weak var delegate: CurrentLocationRepositoryDelegate?

    func getStatus() -> LocationStatusType {
        let status = currentLocationDataStore.statusType
        return status
    }

    func callRequestWhenInUse(complication: @escaping (LocationStatusType) -> Void) {
        currentLocationDataStore.requestWhenInUse { status in
            complication(status)
        }
    }

    func callStartUpdateLocation() {
        currentLocationDataStore.delegate = self
        currentLocationDataStore.startUpdateLocation()
    }
}

extension CurrentLocationRepository: CurrentLocationDataStoreDelegate {
    func updatedLocation(lat: Double, lng: Double) {
        // nextTODO: もしかして位置情報保存しても意味ないかも
        userDefaultsDataStore.latitude = lat
        userDefaultsDataStore.longitude = lng
        userDefaultsDataStore.locationSaved = true

        delegate?.updatedLocation()
    }

    func didFailUpdateLocation() {
        delegate?.didFailUpdateLocation()
    }
}
