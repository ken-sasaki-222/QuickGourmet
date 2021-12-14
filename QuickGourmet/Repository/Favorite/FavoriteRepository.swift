//
//  FavoriteRepository.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/22.
//

import Foundation

class FavoriteRepository: FavoriteRepositoryInterface {
    private let favoriteDataStore = FavoriteDataStore()

    func saveFavoriteShopData(favoriteShop: FavoriteShop, deviceId: String, onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        favoriteDataStore.saveFavoriteShopData(favoriteShop: favoriteShop, deviceId: deviceId) {
            onSuccess()
        } onFailure: { error in
            onFailure(error)
        }
    }

    func getFavoriteShopData(deviceId: String, onSuccess: @escaping ([FavoriteShop]) -> Void, onFailure: @escaping (Error) -> Void) {
        favoriteDataStore.getFavoriteShopData(deviceId: deviceId) { shopes in
            onSuccess(shopes)
        } onFailure: { error in
            onFailure(error)
        }
    }

    func deleteFavoriteShopData(documentID: String, deviceId: String, onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        favoriteDataStore.deleteFavoriteShopData(documentId: documentID, deviceId: deviceId) {
            onSuccess()
        } onFailure: { error in
            onFailure(error)
        }
    }
}
