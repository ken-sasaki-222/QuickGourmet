//
//  FavoriteRepositoryInterface.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/22.
//

import Foundation

protocol FavoriteRepositoryInterface {
    func saveShopInfo(favoriteShopInfo: FavoriteShopInfo)
    func getShopInfo()
    func deleteShopInfo()
}
