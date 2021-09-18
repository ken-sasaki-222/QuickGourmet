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
    private var result: Result<Bool, Error> = .failure(NSError())
    private var error: Error?

    init(userRepository: UserRepositoryInterface, favoriteRepository: FavoriteRepositoryInterface) {
        self.userRepository = userRepository
        self.favoriteRepository = favoriteRepository
        super.init()
    }

    // studyTODO: ①override convenienceの意味調べる、②swiftUIっぽいButtonActionの書き方の件
    override convenience init() {
        self.init(userRepository: RepositoryLocator.getUserRepository(),
                  favoriteRepository: RepositoryLocator.getFavoriteRepository())
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
        userRepository.favoriteListLaunchCount = userRepository.favoriteListLaunchCount
        if userRepository.favoriteListLaunchCount % 10 == 0 {
            return true
        } else {
            return false
        }
    }

    func recordFavoriteShopDetailLaunchCount() -> Bool {
        userRepository.favoriteShopDetailLaunchCount = userRepository.favoriteShopDetailLaunchCount
        if userRepository.favoriteListLaunchCount % 6 == 0 {
            return true
        } else {
            return false
        }
    }
}
