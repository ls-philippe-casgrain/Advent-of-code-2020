//
//  day13_tests.swift
//  Unit Tests
//
//  Created by Philippe Casgrain on 2020-12-13.
//

import XCTest

class day13_tests: XCTestCase {

    var input: String!

    func testExampleOne() throws {

        let bl = BusSchedule(input: "7,13,x,x,59,x,31,19")

        let result = bl.busLine(for: 939)
        XCTAssertEqual(result, 295)
    }

    func testProblemOne() throws {

        let bl = BusSchedule(input: self.input)

        let result = bl.busLine(for: 1008833)
        print("Day 13.1 The answer is: \(result)")
    }

    func testExampleTwo() throws {

        let bl = BusSchedule(input: "7,13,x,x,59,x,31,19")

        let result = bl.gold()
        XCTAssertEqual(result, 1068781)
    }

    func testProblemTwo() throws {

        let bl = BusSchedule(input: self.input)
        let result = bl.gold()
        print("Day 13.2 The answer is: \(result)")
    }

    override func setUpWithError() throws {
        input = "19,x,x,x,x,x,x,x,x,41,x,x,x,x,x,x,x,x,x,643,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,17,13,x,x,x,x,23,x,x,x,x,x,x,x,509,x,x,x,x,x,37,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,x,29"
    }

    override func tearDownWithError() throws {

    }
}
