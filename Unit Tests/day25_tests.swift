//
//  day25_tests.swift
//  Unit Tests
//
//  Created by Philippe Casgrain on 2020-12-25.
//

import XCTest

class day25_tests: XCTestCase {

    func testExampleOne() throws {

        let room = RoomEntry()
        let result = room.privateKey(cardPublic: 5764801, doorPublic: 17807724)

        XCTAssertEqual(result, 14897079)
    }

    func testProblemOne() throws {

        let room = RoomEntry()
        let result = room.privateKey(cardPublic: 11404017, doorPublic: 13768789)
        print("Day 25.1 The answer is: \(result)")
    }


}
