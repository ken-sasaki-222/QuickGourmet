//
//  MockFavoriteRepository.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/22.
//

import Firebase
import Foundation

class MockFavoriteRepository: FavoriteRepositoryInterface {
    var error: Error?
    var result: Bool?

    private let db = Firestore.firestore()
    private let testUid = "testuid"
    var favoriteShopes = [FavoriteShop]()

    func saveFavoriteShopData(favoriteShop: FavoriteShop, completion: @escaping (Result<Bool, Error>) -> Void) {
        db.collection("shopInfo").document(testUid).collection("favorite")
            .addDocument(data: [
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
                    completion(.failure(error))
                } else {
                    print("Success adding document:")
                    completion(.success(true))
                }
            }
    }

    func getFavoriteShopData(_ onSuccess: @escaping ([FavoriteShop]) -> Void, onFailure: @escaping (Error) -> Void) {
        db.collection("shopInfo").document(testUid).collection("favorite").getDocuments { snapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
                onFailure(error)
            }

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
