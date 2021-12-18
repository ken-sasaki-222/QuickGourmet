//
//  CurrentLocationViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/14.
//

import Foundation

class CurrentLocationViewModel: NSObject, ObservableObject {
    private var currentLocationRepository: CurrentLocationRepositoryInterface

    init(currentLocationRepository: CurrentLocationRepositoryInterface) {
        self.currentLocationRepository = currentLocationRepository
        super.init()
    }

    override convenience init() {
        self.init(currentLocationRepository: RepositoryLocator.getCurrentLocationRepository())
    }

    func getStatus() {
        let status = currentLocationRepository.getStatus()
        tapNextPageButton(status: status)
    }

    func callRequestWhenInUse() {
        currentLocationRepository.callRequestWhenInUse { status in
            self.tapNextPageButton(status: status)
        }
    }

    func callStartUpdateLocation() {
        currentLocationRepository.delegate = self
        currentLocationRepository.callStartUpdateLocation()
    }

    func notAllowedAction() {}

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

extension CurrentLocationViewModel: CurrentLocationRepositoryDelegate {
    func updatedLocation() {
        print("登録完了")
    }

    func didFailUpdateLocation() {
        print("登録失敗")
    }
}
