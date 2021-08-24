//
//  FavoriteRepositoryInterface.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/22.
//

import Foundation

protocol FavoriteRepositoryInterface {
    func saveFavoriteShopData(favoriteShop: FavoriteShop)
    func getFavoriteShopData(_ completion: @escaping ([FavoriteShop]) -> Void)
    func deleteFavoriteShopData()
}
