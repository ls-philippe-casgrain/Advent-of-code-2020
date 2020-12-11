//
//  day10_tests.swift
//  Unit Tests
//
//  Created by Philippe Casgrain on 2020-12-10.
//

import XCTest

class day10_tests: XCTestCase {

    var input: [Int]!

    func testExampleOne() throws {

        let adapters = Adapters(input: [16,
                                        10,
                                        15,
                                        5,
                                        1,
                                        11,
                                        7,
                                        19,
                                        6,
                                        12,
                                        4,])

        let result = adapters.useAll()
        XCTAssertEqual(result, 7 * 5)
    }

    func testExampleTwo() throws {

        let adapters = Adapters(input: [28,
                                        33,
                                        18,
                                        42,
                                        31,
                                        14,
                                        46,
                                        20,
                                        48,
                                        47,
                                        24,
                                        23,
                                        49,
                                        45,
                                        19,
                                        38,
                                        39,
                                        11,
                                        1,
                                        32,
                                        25,
                                        35,
                                        8,
                                        17,
                                        7,
                                        9,
                                        4,
                                        2,
                                        34,
                                        10,
                                        3,])

        let result = adapters.useAll()
        XCTAssertEqual(result, 22 * 10)
    }

    func testProblemOne() throws {

        let adapters = Adapters(input: self.input)
        let result = adapters.useAll()
        print("Day 10.1 The answer is: \(result)")
    }

    func testExampleThree() throws {

        let adapters = Adapters(input: [16,
                                        10,
                                        15,
                                        5,
                                        1,
                                        11,
                                        7,
                                        19,
                                        6,
                                        12,
                                        4,])

        let result = adapters.combineAll()
        XCTAssertEqual(result, 8)
    }

    func testExampleFour() throws {

        let adapters = Adapters(input: [28,
                                        33,
                                        18,
                                        42,
                                        31,
                                        14,
                                        46,
                                        20,
                                        48,
                                        47,
                                        24,
                                        23,
                                        49,
                                        45,
                                        19,
                                        38,
                                        39,
                                        11,
                                        1,
                                        32,
                                        25,
                                        35,
                                        8,
                                        17,
                                        7,
                                        9,
                                        4,
                                        2,
                                        34,
                                        10,
                                        3,])

        let result = adapters.combineAll()
        XCTAssertEqual(result, 19208)
    }
    
    func testProblemTwo() throws {

        let adapters = Adapters(input: self.input)
        let result = adapters.combineAll()
        print("Day 10.2 The answer is: \(result)")
    }


    override func setUpWithError() throws {
        input = [99,
                 151,
                 61,
                 134,
                 112,
                 70,
                 75,
                 41,
                 119,
                 137,
                 158,
                 50,
                 167,
                 60,
                 116,
                 117,
                 62,
                 82,
                 31,
                 3,
                 72,
                 88,
                 165,
                 34,
                 8,
                 14,
                 27,
                 108,
                 166,
                 71,
                 51,
                 42,
                 135,
                 122,
                 140,
                 109,
                 1,
                 101,
                 2,
                 77,
                 85,
                 76,
                 143,
                 100,
                 127,
                 7,
                 107,
                 13,
                 148,
                 118,
                 56,
                 159,
                 133,
                 21,
                 154,
                 152,
                 130,
                 78,
                 54,
                 104,
                 160,
                 153,
                 95,
                 49,
                 19,
                 69,
                 142,
                 63,
                 11,
                 12,
                 29,
                 98,
                 84,
                 28,
                 17,
                 146,
                 161,
                 115,
                 4,
                 94,
                 24,
                 126,
                 136,
                 91,
                 57,
                 30,
                 155,
                 79,
                 66,
                 141,
                 48,
                 125,
                 162,
                 37,
                 40,
                 147,
                 18,
                 20,
                 45,
                 55,
                 83,]
    }

    override func tearDownWithError() throws {

    }

}
