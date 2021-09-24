//
//  GenreTypeTranslatorTests.swift
//  QuickGourmetTests
//
//  Created by sasaki.ken on 2021/09/19.
//

@testable import QuickGourmet
import XCTest

class GenreTypeTranslatorTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTranslate_expectAndResultEqual() throws {
        let inputs: [GenreType] = [.izakaya,
                                   .dainingubar,
                                   .sousakuryouri,
                                   .wasyoku,
                                   .yousyoku,
                                   .italian,
                                   .tyuuka,
                                   .yakiniku,
                                   .aziaryouri,
                                   .kakukokuryouri,
                                   .karaoke,
                                   .kakuteru,
                                   .ramen,
                                   .cafe,
                                   .other,
                                   .okonomiyaki,
                                   .corearyouri]

        let expects = ["G001",
                       "G002",
                       "G003",
                       "G004",
                       "G005",
                       "G006",
                       "G007",
                       "G008",
                       "G009",
                       "G010",
                       "G011",
                       "G012",
                       "G013",
                       "G014",
                       "G015",
                       "G016",
                       "G017"]

        for (index, input) in inputs.enumerated() {
            let expect = expects[index]
            let result = GenreTypeTranslator.translate(genre: input)
            XCTAssertEqual(result, expect)
        }
    }
}
