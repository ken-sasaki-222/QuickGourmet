//
//  HamburgerMenuViewModelTests.swift
//  QuickGourmetTests
//
//  Created by sasaki.ken on 2021/09/22.
//

@testable import QuickGourmet
import XCTest

class HamburgerMenuViewModelTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGoToDeveloperSNSPage_expectAndResultEqual() throws {
        let inputs = ["twitter", "gitHub", "qiita"]
        let expects = ["https://twitter.com/ken_sasaki2", "https://github.com/ken-sasaki-222", "https://qiita.com/nkekisasa222"]

        for (index, input) in inputs.enumerated() {
            let expect = URL(string: expects[index])
            let result = HamburgerMenuViewModel().goToDeveloperSNSPage(snsString: input)
            XCTAssertEqual(expect, result)
        }
    }
}
