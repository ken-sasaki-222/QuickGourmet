//
//  AppTrackingTransparencyStatusTranslatorTests.swift
//  QuickGourmetTests
//
//  Created by sasaki.ken on 2021/12/29.
//

import AppTrackingTransparency
import XCTest

class AppTrackingTransparencyStatusTranslatorTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTranslate() throws {
        let inputs: [ATTrackingManager.AuthorizationStatus] = [
            .authorized,
            .denied,
            .notDetermined,
            .restricted
        ]

        let expects: [AppTrackingTransparencyStatusType] = [
            .authorized,
            .denied,
            .notDetermined,
            .restricted,
            .unknown
        ]

        for (index, input) in inputs.enumerated() {
            let expect = expects[index]
            let result = AppTrackingTransparencyStatusTranslator.translate(input: input)
            XCTAssertEqual(expect, result)
        }
    }
}
