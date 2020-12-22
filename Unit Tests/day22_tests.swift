//
//  day22_tests.swift
//  Unit Tests
//
//  Created by Philippe Casgrain on 2020-12-22.
//
import XCTest

class day22_tests: XCTestCase {

    func testExampleOne() throws {

        let cg = CrabGame(player1: """
                                   9
                                   2
                                   6
                                   3
                                   1
                                   """,
                          player2: """
                                   5
                                   8
                                   4
                                   7
                                   10
                                   """)
        let result = cg.winningScore()
        XCTAssertEqual(result, 306)
    }

    func testProblemOne() throws {

        let cg = CrabGame(player1: """
                                   12
                                   40
                                   50
                                   4
                                   24
                                   15
                                   22
                                   43
                                   18
                                   21
                                   2
                                   42
                                   27
                                   36
                                   6
                                   31
                                   35
                                   20
                                   32
                                   1
                                   41
                                   14
                                   9
                                   44
                                   8
                                   """,
                          player2: """
                                   30
                                   10
                                   47
                                   29
                                   13
                                   11
                                   49
                                   7
                                   25
                                   37
                                   33
                                   48
                                   16
                                   5
                                   45
                                   19
                                   17
                                   26
                                   46
                                   23
                                   34
                                   39
                                   28
                                   3
                                   38
                                   """)
        let result = cg.winningScore()
        print("Day 22.1 The answer is: \(result)")
    }

    func testExampleTwo() throws {

        let cg = CrabGame(player1: """
                                   9
                                   2
                                   6
                                   3
                                   1
                                   """,
                          player2: """
                                   5
                                   8
                                   4
                                   7
                                   10
                                   """)
        let result = cg.winningRecursiveScore()
        XCTAssertEqual(result, 291)
    }

    func testProblemTwo() throws {
        let cg = CrabGame(player1: """
                                   12
                                   40
                                   50
                                   4
                                   24
                                   15
                                   22
                                   43
                                   18
                                   21
                                   2
                                   42
                                   27
                                   36
                                   6
                                   31
                                   35
                                   20
                                   32
                                   1
                                   41
                                   14
                                   9
                                   44
                                   8
                                   """,
                          player2: """
                                   30
                                   10
                                   47
                                   29
                                   13
                                   11
                                   49
                                   7
                                   25
                                   37
                                   33
                                   48
                                   16
                                   5
                                   45
                                   19
                                   17
                                   26
                                   46
                                   23
                                   34
                                   39
                                   28
                                   3
                                   38
                                   """)
        let result = cg.winningRecursiveScore()
        print("Day 22.2 The answer is: \(result)")
    }

    override func setUpWithError() throws {

    }

}
