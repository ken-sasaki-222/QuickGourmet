//
//  CurrentLocationViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/14.
//

import Foundation

class CurrentLocationViewModel: NSObject, ObservableObject {
    private let currentLocationRepository: CurrentLocationRepositoryInterface

    init(currentLocationRepository: CurrentLocationRepositoryInterface) {
        self.currentLocationRepository = currentLocationRepository
        super.init()
    }

    override convenience init() {
        self.init(currentLocationRepository: RepositoryLocator.getCurrentLocationRepository())
    }
}
