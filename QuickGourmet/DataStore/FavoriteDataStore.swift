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

    func saveFavoriteShopData(favoriteShop: FavoriteShop, deviceId: String, onSuccess: @escaping () -> Void, onFailure: @escaping () -> Void) {
        // test firebase用意 -> 記事にする
        // save test書く
        // get, delete書く
        // get delete test書く

        db.collection("shopData").document(deviceId).collection("favoriteShopes").addDocument(data: [
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
                onFailure()
            } else {
                print("Success adding document.")
                onSuccess()
            }
        }
    }
}
