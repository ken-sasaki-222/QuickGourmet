//
//  FavoriteViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/22.
//

import Foundation

class FavoriteViewModel {
    private let favoriteRepository = FavoriteRepository()
    var favoriteShopInfo: FavoriteShopInfo?

    func communicateRepository(favoriteShopInfo: FavoriteShopInfo) {
        favoriteRepository.saveShopInfo(favoriteShopInfo: favoriteShopInfo)
    }
}
