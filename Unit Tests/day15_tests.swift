//
//  day15_tests.swift
//  Unit Tests
//
//  Created by Philippe Casgrain on 2020-12-15.
//

import Foundation

import XCTest

class day15_tests: XCTestCase {

    var input: String!

    func testExampleOne() throws {

        var game = MemoryGame(input: "0,3,6")
        var result = game.play(until: 2020)
        XCTAssertEqual(result, 436)

        game = MemoryGame(input: "1,3,2")
        result = game.play(until: 2020)
        XCTAssertEqual(result, 1)

        game = MemoryGame(input: "2,1,3")
        result = game.play(until: 2020)
        XCTAssertEqual(result, 10)

        game = MemoryGame(input: "1,2,3")
        result = game.play(until: 2020)
        XCTAssertEqual(result, 27)

        game = MemoryGame(input: "2,3,1")
        result = game.play(until: 2020)
        XCTAssertEqual(result, 78)

        game = MemoryGame(input: "3,2,1")
        result = game.play(until: 2020)
        XCTAssertEqual(result, 438)

        game = MemoryGame(input: "3,1,2")
        result = game.play(until: 2020)
        XCTAssertEqual(result, 1836)
    }

    func testProblemOne() throws {

        let game = MemoryGame(input: self.input)

        let result = game.play(until: 2020)
        print("Day 15.1 The answer is: \(result)")
    }

    func testExampleTwo() throws {

        var game = MemoryGame(input: "0,3,6")
        var result = game.play(until: 30000000)
        XCTAssertEqual(result, 175594)

        game = MemoryGame(input: "1,3,2")
        result = game.play(until: 30000000)
        XCTAssertEqual(result, 2578)

        game = MemoryGame(input: "2,1,3")
        result = game.play(until: 30000000)
        XCTAssertEqual(result, 3544142)

        game = MemoryGame(input: "1,2,3")
        result = game.play(until: 30000000)
        XCTAssertEqual(result, 261214)

        game = MemoryGame(input: "2,3,1")
        result = game.play(until: 30000000)
        XCTAssertEqual(result, 6895259)

        game = MemoryGame(input: "3,2,1")
        result = game.play(until: 30000000)
        XCTAssertEqual(result, 18)

        game = MemoryGame(input: "3,1,2")
        result = game.play(until: 30000000)
        XCTAssertEqual(result, 362)
    }

    func testProblemTwo() throws {

        let game = MemoryGame(input: self.input)

        let result = game.play(until: 30000000)
        print("Day 15.2 The answer is: \(result)")
    }

    override func setUpWithError() throws {
        input = "14,3,1,0,9,5"
    }

    override func tearDownWithError() throws {

    }
}
