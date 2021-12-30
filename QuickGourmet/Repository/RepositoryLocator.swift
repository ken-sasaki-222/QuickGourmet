//
//  RepositoryLocator.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/09/04.
//

import Foundation

class RepositoryLocator: NSObject {
    static var isMock: Bool {
        ProcessInfo.processInfo.environment["MOCK"] == "MOCK"
    }

    static func getUserRepository() -> UserRepositoryInterface {
        UserRepository()
    }

    static func getShopSearchRepository() -> ShopRepositoryInterface {
        ShopSearchRepository()
    }

    static func getFavoriteRepository() -> FavoriteRepositoryInterface {
        FavoriteRepository()
    }

    static func getGenreTypeRepository() -> GenreTypeRepositoryInterface {
        GenreTypeRepository()
    }

    static func getPickerSelectTypeRepository() -> PickerSelectTypeRepositoryInterface {
        PickerSelectTypeRepository()
    }

    static func getLocatePermissionRepository() -> LocatePermissionRepositoryInterface {
        LocatePermissionRepository()
    }

    static func getAppTrackingTransparencyRepository() -> AppTrackingTransparencyRepositoryInterface {
        AppTrackingTransparencyRepository()
    }

    static func getReviewRepository() -> ReviewRepositoryInterface {
        ReviewRepository()
    }
}
