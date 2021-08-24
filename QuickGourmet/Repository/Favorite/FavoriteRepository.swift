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
    private var favoriteShopInfoArray = [FavoriteShopInfo]()

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
                "latitude": favoriteShopInfo.latitude,
                "longitude": favoriteShopInfo.longitude,
                "urlString": favoriteShopInfo.urlString
            ]) { error in
                if let error = error {
                    print("Error adding document:", error)
                } else {
                    print("Success adding document:")
                }
            }
    }

    func getShopInfo(_ completion: @escaping ([FavoriteShopInfo]) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }

        db.collection("shopInfo").document(uid).collection("favorite").getDocuments { snapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
                return
            }

            self.favoriteShopInfoArray = []
            print("querySnapshot", snapshot?.documents as Any)

            if let snapshotDocuments = snapshot?.documents {
                for document in snapshotDocuments {
                    let documentData = document.data()

                    guard let documentName = documentData["name"] as? String,
                          let documentAddress = documentData["address"] as? String,
                          let documentMobileAccess = documentData["mobileAccess"] as? String,
                          let documentAverage = documentData["average"] as? String,
                          let documentOpen = documentData["open"] as? String,
                          let documentGenreName = documentData["genreName"] as? String,
                          let documentLogoImage = documentData["logoImage"] as? String,
                          let documentLatitude = documentData["latitude"] as? Double,
                          let documentLongitude = documentData["longitude"] as? Double,
                          let documentUrlString = documentData["urlString"] as? String
                    else {
                        return
                    }

                    let favoriteShopInfo = FavoriteShopInfo(
                        name: documentName,
                        address: documentAddress,
                        mobileAccess: documentMobileAccess,
                        average: documentAverage,
                        open: documentOpen,
                        genreName: documentGenreName,
                        logoImage: documentLogoImage,
                        latitude: documentLatitude,
                        longitude: documentLongitude,
                        urlString: documentUrlString
                    )
                    self.favoriteShopInfoArray.append(favoriteShopInfo)
                    print("kenken", self.favoriteShopInfoArray)

                    completion(self.favoriteShopInfoArray)
                }
            }
        }
    }

    func deleteShopInfo() {}
}
