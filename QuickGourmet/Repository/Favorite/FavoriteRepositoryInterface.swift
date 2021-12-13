//
//  FavoriteRepositoryInterface.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/22.
//

import Foundation

protocol FavoriteRepositoryInterface {
    func saveFavoriteShopData(favoriteShop: FavoriteShop, deviceId: String, onSuccess: @escaping () -> Void, onFailure: @escaping () -> Void)
    func getFavoriteShopData(_ onSuccess: @escaping ([FavoriteShop]) -> Void, onFailure: @escaping (Error) -> Void)
    func deleteFavoriteShopData(documentID: String, completion: @escaping (Result<Bool, Error>) -> Void)
}
