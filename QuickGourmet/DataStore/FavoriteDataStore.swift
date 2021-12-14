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

    func getFavoriteShopData(deviceId: String, onSuccess: @escaping ([FavoriteShop]) -> Void, onFailure: @escaping (Error) -> Void) {
        db.collection(shopData).document(deviceId).collection(favorite).getDocuments { snapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
                onFailure(error)
            } else {
                self.favoriteShopes = []

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
                              let documentPhoto = documentData["photo"] as? String,
                              let documentLatitude = documentData["latitude"] as? Double,
                              let documentLongitude = documentData["longitude"] as? Double,
                              let documentUrlString = documentData["urlString"] as? String,
                              let documentID = document.documentID as String?
                        else {
                            let error = error ?? NSError(domain: "Required document data not found.", code: -4, userInfo: nil)
                            onFailure(error)
                            return
                        }

                        let favoriteShop = FavoriteShop(
                            name: documentName,
                            address: documentAddress,
                            mobileAccess: documentMobileAccess,
                            average: documentAverage,
                            open: documentOpen,
                            genreName: documentGenreName,
                            logoImage: documentLogoImage,
                            photo: documentPhoto,
                            latitude: documentLatitude,
                            longitude: documentLongitude,
                            urlString: documentUrlString,
                            documentID: documentID
                        )

                        self.favoriteShopes.append(favoriteShop)
                        onSuccess(self.favoriteShopes)
                    }
                }
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
