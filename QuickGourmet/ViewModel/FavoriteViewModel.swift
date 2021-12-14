//
//  FavoriteViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/22.
//

import Foundation

class FavoriteViewModel: NSObject, ObservableObject {
    @Published var favoriteShopData: [FavoriteShop] = []
    private var userRepository: UserRepositoryInterface
    private let favoriteRepository: FavoriteRepositoryInterface

    init(userRepository: UserRepositoryInterface, favoriteRepository: FavoriteRepositoryInterface) {
        self.userRepository = userRepository
        self.favoriteRepository = favoriteRepository
        super.init()
    }

    override convenience init() {
        self.init(userRepository: RepositoryLocator.getUserRepository(),
                  favoriteRepository: RepositoryLocator.getFavoriteRepository())
    }

    func saveFavoriteShop(favoriteShop: FavoriteShop) {
        let deviceId = userRepository.deviceId

        favoriteRepository.saveFavoriteShopData(favoriteShop: favoriteShop, deviceId: deviceId) {
            // success
        } onFailure: { error in
            print("Save favorite shop error.", error)
        }
    }

    func getFavoriteShop() {
        let deviceId = userRepository.deviceId

        favoriteRepository.getFavoriteShopData(deviceId: deviceId) { shopes in
            self.favoriteShopData = shopes
            print("favoriteShopData", self.favoriteShopData)
        } onFailure: { error in
            print("Get favorite shop error.", error)
        }
    }

    func deleateFavoriteShop(documentID: String) {
        let deviceId = userRepository.deviceId

        favoriteRepository.deleteFavoriteShopData(documentID: documentID, deviceId: deviceId) {
            // success
        } onFailure: { error in
            print("Delete favorite shop error.", error)
        }
    }

    func recordFavoriteListLaunchCount() -> Bool {
        userRepository.favoriteListLaunchCount = userRepository.favoriteListLaunchCount
        if userRepository.favoriteListLaunchCount % 10 == 0 {
            return true
        } else {
            return false
        }
    }

    func recordFavoriteShopDetailLaunchCount() -> Bool {
        userRepository.favoriteShopDetailLaunchCount = userRepository.favoriteShopDetailLaunchCount
        if userRepository.favoriteShopDetailLaunchCount % 6 == 0 {
            return true
        } else {
            return false
        }
    }
}
