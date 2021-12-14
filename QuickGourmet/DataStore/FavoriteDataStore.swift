//
//  FavoriteDataStore.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/11.
//

import Firebase
import Foundation

class FavoriteDataStore {
    private let db = Firestore.firestore()
    private var favoriteShopes = [FavoriteShop]()
    private let shopData = "shopData"
    private let favorite = "favorite"

    func saveFavoriteShopData(favoriteShop: FavoriteShop, deviceId: String, onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        db.collection(shopData).document(deviceId).collection(favorite).addDocument(data: [
            "name": favoriteShop.name,
            "address": favoriteShop.address,
            "mobileAccess": favoriteShop.mobileAccess,
            "average": favoriteShop.average,
            "open": favoriteShop.open,
            "genreName": favoriteShop.genreName,
            "logoImage": favoriteShop.logoImage,
            "photo": favoriteShop.photo,
            "latitude": favoriteShop.latitude,
            "longitude": favoriteShop.longitude,
            "urlString": favoriteShop.urlString
        ]) { error in
            if let error = error {
                print("Error adding document:", error)
                onFailure(error)
            } else {
                print("Success adding document.")
                onSuccess()
            }
        }
    }

    func deleteFavoriteShopData(documentId: String, deviceId: String, onSuccess: @escaping () -> Void, onFailure: @escaping (Error) -> Void) {
        db.collection(shopData).document(deviceId).collection(favorite).document(documentId).delete { error in
            if let error = error {
                print("Error removing document:", error)
                onFailure(error)
            } else {
                print("Document successfully removed.")
                onSuccess()
            }
        }
    }
}
