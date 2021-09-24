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
    let mockShopSearchRepository = MockShopSearchRepository()
    let userRepository = UserRepository()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetShopData_requestKeyIsNil_expectAndResultEqual() throws {
        let request = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=&lat=35.6465202848107&lng=139.62975824675942&range=3&genre=G001&count=100&format=json"
        let expectation: XCTestExpectation = expectation(description: "wait for finish")
        let expectMessage = "The data couldn’t be read because it is missing."

        mockShopSearchRepository.fetchShopData(requestString: request) { result in
            switch result {
            case .success:
                return
            case let .failure(error):
                let result = error.localizedDescription
                XCTAssertEqual(expectMessage, result)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }

    func testGetShopData_requestLocationIsNotJapan_expectAndResultEqual() throws {
        let request = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=8038faee5cb2aff5&lat=37.785834&lng=-122.406417&range=3&genre=G001&count=100&format=json"
        let expectation: XCTestExpectation = expectation(description: "wait for finish")

        mockShopSearchRepository.fetchShopData(requestString: request) { result in
            switch result {
            case let .success(shopes):
                let result = shopes
                let expect = 0
                XCTAssertEqual(expect, result.count)
            case .failure:
                return
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }

    func testGetShopData_requestRangeIsNil_resultIsNotNil() throws {
        let request = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=8038faee5cb2aff5&lat=35.6465202848107&lng=139.62975824675942&range=&genre=&count=100&format=json"
        let expectation: XCTestExpectation = expectation(description: "wait for finish")

        mockShopSearchRepository.fetchShopData(requestString: request) { result in
            switch result {
            case let .success(shopes):
                let result = shopes
                XCTAssertNotNil(result)
            case .failure:
                return
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }

    func testGetShopData_requestGenreIsNil_resultIsNotNil() throws {
        let request = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=8038faee5cb2aff5&lat=35.6465202848107&lng=139.62975824675942&range=3&genre=&count=100&format=json"
        let expectation: XCTestExpectation = expectation(description: "wait for finish")

        mockShopSearchRepository.fetchShopData(requestString: request) { result in
            switch result {
            case let .success(shopes):
                let result = shopes
                XCTAssertNotNil(result)
            case .failure:
                return
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }

    func testRecordSearchListLaunchCount_ValidateTrueOrFalse() throws {
        XCTContext.runActivity(named: "searchListLaunchCountが10の倍数の場合") { _ in
            userRepository.searchListLaunchCount = 8
            let expect = quickSearchVM.recordSearchListLaunchCount()
            XCTAssertTrue(expect)
        }
        XCTContext.runActivity(named: "searchListLaunchCountが10の倍数じゃない場合") { _ in
            userRepository.searchListLaunchCount = 0
            let expect = quickSearchVM.recordSearchListLaunchCount()
            XCTAssertFalse(expect)
        }
    }

    func testRecordShopDetailLaunchCount_ValidateTrueOrFalse() throws {
        XCTContext.runActivity(named: "shopDetailLaunchCountが6の倍数の場合") { _ in
            userRepository.shopDetailLaunchCount = 4
            let expect = quickSearchVM.recordShopDetailLaunchCount()
            XCTAssertTrue(expect)
        }
        XCTContext.runActivity(named: "shopDetailLaunchCountが6の倍数じゃない場合") { _ in
            userRepository.shopDetailLaunchCount = 0
            let expect = quickSearchVM.recordShopDetailLaunchCount()
            XCTAssertFalse(expect)
        }
    }
}
