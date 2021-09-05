//
//  FavoriteViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/22.
//

import Foundation

class FavoriteViewModel: NSObject, ObservableObject {
    @Published var favoriteShopData: [FavoriteShop] = []
    private let favoriteRepository: FavoriteRepositoryInterface
    private let userDefaultsDataStore = UserDefaultsDataStore()
    
    init(favoriteRepository: FavoriteRepositoryInterface) {
        self.favoriteRepository = favoriteRepository
        super.init()
    }
    
    convenience override init() {
        self.init(favoriteRepository: RepositoryLocator.getFavoriteRepository())
    }

    func saveFavoriteShop(favoriteShop: FavoriteShop) {
        favoriteRepository.saveFavoriteShopData(favoriteShop: favoriteShop)
    }

    func getFavoriteShop() {
        favoriteRepository.getFavoriteShopData { shopes in
            self.favoriteShopData = shopes
            print("favoriteShopData", self.favoriteShopData)
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
        userDefaultsDataStore.favoriteShopDetailLaunchCount = userDefaultsDataStore.favoriteShopDetailLaunchCount
        if userDefaultsDataStore.favoriteListLaunchCount % 6 == 0 {
            return true
        } else {
            return false
        }
    }
}
