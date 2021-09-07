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
    private var result: Result<Bool, Error> = .failure(NSError())
    private var error: Error?

    init(favoriteRepository: FavoriteRepositoryInterface) {
        self.favoriteRepository = favoriteRepository
        super.init()
    }

    // studyTODO: ①override convenienceの意味調べる、②swiftUIっぽいButtonActionの書き方の件
    override convenience init() {
        self.init(favoriteRepository: RepositoryLocator.getFavoriteRepository())
    }

    func saveFavoriteShop(favoriteShop: FavoriteShop) {
        favoriteRepository.saveFavoriteShopData(favoriteShop: favoriteShop) { result in
            self.result = result
        }
    }

    func getFavoriteShop() {
        favoriteRepository.getFavoriteShopData { shopes in
            self.favoriteShopData = shopes
            print("favoriteShopData", self.favoriteShopData)
        } onFailure: { error in
            self.error = error
            print("getFavoriteShop.error", self.error as Any)
        }
    }

    func deleateFavoriteShop(documentID: String) {
        favoriteRepository.deleteFavoriteShopData(documentID: documentID) { result in
            self.result = result
        }
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
