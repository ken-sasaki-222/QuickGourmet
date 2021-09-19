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
    let favoriteVM = FavoriteViewModel()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
