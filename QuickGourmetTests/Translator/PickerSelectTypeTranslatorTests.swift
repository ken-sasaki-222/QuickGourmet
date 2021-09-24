//
//  PickerSelectTypeTranslatorTests.swift
//  QuickGourmetTests
//
//  Created by sasaki.ken on 2021/09/18.
//

@testable import QuickGourmet
import XCTest

class PickerSelectTypeTranslatorTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTranslate_expectAndResultEqual() throws {
        let inputs: [PickerSelectType] = [.fourMinutesWalk,
                                          .sevenMinutesWalk,
                                          .thirteenMinuteWalk,
                                          .twentyFiveMinutes,
                                          .thirtyEightMinuteWalk]

        let expects = [1, 2, 3, 4, 5]

        for (index, input) in inputs.enumerated() {
            let expect = expects[index]
            let result = PickerSelectTypeTranslator.translate(selectType: input)
            XCTAssertEqual(result, expect)
        }
    }
}
