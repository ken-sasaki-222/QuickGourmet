//
//  FavoriteViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/22.
//

import Foundation

class FavoriteViewModel: ObservableObject {
    @Published var favoriteShopData: [FavoriteShop] = []
    private let favoriteRepository = FavoriteRepository()
    private let userDefaultsDataStore = UserDefaultsDataStore()

    func saveFavoriteShop(favoriteShop: FavoriteShop) {
        favoriteRepository.saveFavoriteShopData(favoriteShop: favoriteShop)
    }

    func getFavoriteShop() {
        favoriteRepository.getFavoriteShopData { shopes in
            self.favoriteShopData = shopes
            print("kenken", self.favoriteShopData)
        }
    }

    func deleateFavoriteShop(documentID: String) {
        favoriteRepository.deleteFavoriteShopData(documentID: documentID)
    }

    func recordFavoriteListLaunchCount() -> Bool {
        userDefaultsDataStore.favoriteListLaunchCount = userDefaultsDataStore.favoriteListLaunchCount
        if userDefaultsDataStore.favoriteListLaunchCount % 10 == 0 {
            return true
        } else {
            return false
        }
    }

    func recordFavoriteShopDetailLaunchCount() -> Bool {
        userDefaultsDataStore.favoriteListLaunchCount = userDefaultsDataStore.favoriteListLaunchCount
        if userDefaultsDataStore.favoriteListLaunchCount % 6 == 0 {
            return true
        } else {
            return false
        }
    }
}
