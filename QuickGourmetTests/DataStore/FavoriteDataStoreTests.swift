//
//  FavoriteDataStoreTests.swift
//  QuickGourmetTests
//
//  Created by sasaki.ken on 2021/12/13.
//

import XCTest

class FavoriteDataStoreTests: XCTestCase {
    private let deviceId = "3407941F-7845-40C5-B59D-2A41D2D6AFE6"
    private let exp = XCTestExpectation(description: "wait async")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Firebaseを本番 or デバックで分岐している
    // UnitTestはデバック版コンソールで確認

    func testSaveFavoriteShopData() throws {
        let dataStore = FavoriteDataStore()
        let favoriteShop = mockFavoriteShopesData[0]

        dataStore.saveFavoriteShopData(favoriteShop: favoriteShop, deviceId: deviceId) {
            print("Success save favorite shop data.")
            self.exp.fulfill()
        } onFailure: { error in
            print("Fail save favorite shop data.")
            XCTFail(error.localizedDescription)
            self.exp.fulfill()
        }
        wait(for: [exp], timeout: 20)
    }

    func testGetFavoriteShopData() throws {
        let dataStore = FavoriteDataStore()
        dataStore.getFavoriteShopData(deviceId: deviceId) { shopes in
            print("Success get favorite shop data.")
            print("shopes:", shopes)
            XCTAssertNotNil(shopes)
            self.exp.fulfill()
        } onFailure: { error in
            print("Fail get favorite shop data.")
            XCTFail(error.localizedDescription)
            self.exp.fulfill()
        }
        wait(for: [exp], timeout: 20)
    }

    func testDeleteFavoriteShopData() async throws {
        let dataStore = FavoriteDataStore()
        let documentId = "" // Firestoreからコピペする

        dataStore.deleteFavoriteShopData(documentId: documentId, deviceId: deviceId) {
            print("Success delete favorite shop data.")
            self.exp.fulfill()
        } onFailure: { error in
            print("Fail delete favorite shop data.")
            XCTFail(error.localizedDescription)
            self.exp.fulfill()
        }
        wait(for: [exp], timeout: 20)
    }
}
