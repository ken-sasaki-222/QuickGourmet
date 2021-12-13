//
//  FavoriteDataStoreTests.swift
//  QuickGourmetTests
//
//  Created by sasaki.ken on 2021/12/13.
//

import XCTest

class FavoriteDataStoreTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSaveFavoriteShopData() throws {
        let dataStore = FavoriteDataStore()
        let favoriteShop = mockFavoriteShopesData[0]
        let deviceId = "3407941F-7845-40C5-B59D-2A41D2D6AFE6"
        let exp = XCTestExpectation(description: "wait async")

        dataStore.saveFavoriteShopData(favoriteShop: favoriteShop, deviceId: deviceId) {
            print("Success save favorite shop data.")
            exp.fulfill()
        } onFailure: {
            XCTFail("Fail save favorite shop data.")
            exp.fulfill()
        }
        wait(for: [exp], timeout: 20)
    }
}
