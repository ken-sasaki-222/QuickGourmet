//
//  ShopDataStoreTests.swift
//  QuickGourmetTests
//
//  Created by sasaki.ken on 2021/12/11.
//

import XCTest

class ShopDataStoreTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchShopData() async throws {
        let dataStore = ShopDataStore()
        let request = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=\(APIKEY)&lat=35.6465202848107&lng=139.62975824675942&range=3&genre=G001&count=100&format=json"
        let response = try await dataStore.fetchShopDate(requestString: request)
        print("Success fetch shop data.")
        print("response:", response)
        XCTAssertNotNil(response)
    }
}
