//
//  day23_tests.swift
//  Unit Tests
//
//  Created by Philippe Casgrain on 2020-12-23.
//

import XCTest

class day23_tests: XCTestCase {

    func testExampleOne() throws {

        var cc = CrabChallenge(input: "389125467", total: 9)
        let result = cc.cupLabels()
        XCTAssertEqual(result, "67384529")
    }

    func testProblemOne() throws {

        var cc = CrabChallenge(input: "784235916", total: 9)
        let result = cc.cupLabels()
        print("Day 23.2 The answer is: \(result)")
    }

    func testExampleTwo() throws {

        var cc = CrabChallenge(input: "389125467", total: 1000000)
        let result = cc.twoCups()
        XCTAssertEqual(result, 149245887792)
    }

    func testProblemTwo() throws {
        var cc = CrabChallenge(input: "784235916", total: 1000000)
        let result = cc.twoCups()
        print("Day 23.2 The answer is: \(result)")
    }

}
