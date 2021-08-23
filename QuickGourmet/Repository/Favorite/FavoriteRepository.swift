//
//  FavoriteRepository.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/22.
//

import Firebase
import FirebaseAuth
import Foundation

class FavoriteRepository: FavoriteRepositoryInterface {
    private let db = Firestore.firestore()

    func saveShopInfo(favoriteShopInfo: FavoriteShopInfo) {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }

        db.collection("shopInfo").document(uid).collection("favorite")
            .addDocument(data: [
                "name": favoriteShopInfo.name,
                "address": favoriteShopInfo.address,
                "mobileAccess": favoriteShopInfo.mobileAccess,
                "average": favoriteShopInfo.average,
                "open": favoriteShopInfo.open,
                "genreName": favoriteShopInfo.genreName,
                "logoImage": favoriteShopInfo.logoImage,
            ]) { error in
                if let error = error {
                    print("Error adding document:", error)
                } else {
                    print("Success adding document:")
                }
            }
    }

    func getShopInfo() {}

    func deleteShopInfo() {}
}
