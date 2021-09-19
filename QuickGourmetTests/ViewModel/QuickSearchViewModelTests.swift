//
//  QuickSearchViewModelTests.swift
//  QuickGourmetTests
//
//  Created by sasaki.ken on 2021/09/19.
//

@testable import QuickGourmet
import XCTest

class QuickSearchViewModelTests: XCTestCase {
    let quickSearchVM = QuickSearchViewModel()
    let userRepository = UserRepository()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRecordSearchListLaunchCount_ValidateTrueOrFalse() throws {
        XCTContext.runActivity(named: "SearchListLaunchCountが10回目の場合") { _ in
            userRepository.searchListLaunchCount = 8
            let expect = quickSearchVM.recordSearchListLaunchCount()
            XCTAssertTrue(expect)
        }
        XCTContext.runActivity(named: "SearchListLaunchCountが10回目じゃない場合") { _ in
            userRepository.searchListLaunchCount = 5
            let expect = quickSearchVM.recordSearchListLaunchCount()
            XCTAssertFalse(expect)
        }
    }
}
