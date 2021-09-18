//
//  FavoriteRepositoryInterface.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/22.
//

import Foundation

protocol FavoriteRepositoryInterface {
    func saveFavoriteShopData(favoriteShop: FavoriteShop, completion: @escaping (Result<Bool, Error>) -> Void)
    func getFavoriteShopData(_ onSuccess: @escaping ([FavoriteShop]) -> Void, onFailure: @escaping (Error) -> Void)
    func deleteFavoriteShopData(documentID: String, completion: @escaping (Result<Bool, Error>) -> Void)
}
