//
//  FavoriteViewModelTests.swift
//  QuickGourmetTests
//
//  Created by sasaki.ken on 2021/09/19.
//

@testable import QuickGourmet
import XCTest

class FavoriteViewModelTests: XCTestCase {
    let userRepository = UserRepository()
    let mockFavoriteRepository = MockFavoriteRepository()
    let favoriteVM = FavoriteViewModel()

    override func setUpWithError() throws {
        // FirebaseTestHelper().setUpFirestoreEmulator()
    }

    override func tearDownWithError() throws {
        // FirebaseTestHelper().deleteFirebaseApp()
    }

    // 現状本番DBでテストしてしまっている
    func testSaveFavoriteShop_expectAndResultEqual() throws {
        let expectation: XCTestExpectation = expectation(description: "wait for finish")
        mockFavoriteRepository.saveFavoriteShopData(favoriteShop: mockFavoriteShopesData[0]) { result in
            switch result {
            case let .success(result):
                let expect = true
                XCTAssertEqual(expect, result)
            case .failure:
                return
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }

    func testRecordFavoriteListLaunchCount_ValidateTrueOrFalse() throws {
        XCTContext.runActivity(named: "favoriteListLaunchCountが10の倍数の場合") { _ in
            userRepository.favoriteListLaunchCount = 8
            let expect = favoriteVM.recordFavoriteListLaunchCount()
            XCTAssertTrue(expect)
        }
        XCTContext.runActivity(named: "favoriteListLaunchCountが10の倍数でない場合") { _ in
            userRepository.favoriteListLaunchCount = 5
            let expect = favoriteVM.recordFavoriteListLaunchCount()
            XCTAssertFalse(expect)
        }
    }

    func testRecordFavoriteShopDetailLaunchCount_ValidateTrueOrFalse() {
        XCTContext.runActivity(named: "favoriteShopDetailLaunchCountが6の倍数の場合") { _ in
            userRepository.favoriteShopDetailLaunchCount = 4
            let expect = favoriteVM.recordFavoriteShopDetailLaunchCount()
            XCTAssertTrue(expect)
        }
        XCTContext.runActivity(named: "favoriteShopDetailLaunchCountが6の倍数でない場合") { _ in
            userRepository.favoriteShopDetailLaunchCount = 2
            let expect = favoriteVM.recordFavoriteShopDetailLaunchCount()
            XCTAssertFalse(expect)
        }
    }
}
