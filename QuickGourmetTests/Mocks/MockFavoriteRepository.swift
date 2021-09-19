//
//  MockFavoriteRepository.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/22.
//

import Foundation

class MockFavoriteRepository: FavoriteRepositoryInterface {
    var error: Error?
    var result: Bool?
    var favoriteShopes: [FavoriteShop] = []

    func saveFavoriteShopData(favoriteShop: FavoriteShop, completion: @escaping (Result<Bool, Error>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else {
            guard let result = result else {
                return
            }
            completion(.success(result))
        }
    }

    func getFavoriteShopData(_ onSuccess: @escaping ([FavoriteShop]) -> Void, onFailure: @escaping (Error) -> Void) {
        if let error = error {
            onFailure(error)
        } else {
            onSuccess(favoriteShopes)
        }
    }

    func deleteFavoriteShopData(documentID: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else {
            guard let result = result else {
                return
            }
            completion(.success(result))
        }
    }
}
