//
//  day12_tests.swift
//  Unit Tests
//
//  Created by Philippe Casgrain on 2020-12-11.
//

import XCTest

class day12_tests: XCTestCase {

    var input: [String]!

    func testExampleOne() throws {

        let nav = Navigation(input: ["F10",
                                     "N3",
                                     "F7",
                                     "R90",
                                     "F11",])

        let result = nav.manhattanDistance()
        XCTAssertEqual(result, 25)
    }

    func testProblemOne() throws {

        let nav = Navigation(input: self.input)
        let result = nav.manhattanDistance()
        print("Day 12.1 The answer is: \(result)")
    }

    func testExampleTwo() throws {

        let nav = Navigation(input: ["F10",
                                     "N3",
                                     "F7",
                                     "R90",
                                     "F11",])

        let result = nav.manhattanDistance2()
        XCTAssertEqual(result, 286)
    }

    func testProblemTwo() throws {

        let nav = Navigation(input: self.input)
        let result = nav.manhattanDistance2()
        print("Day 12.2 The answer is: \(result)")
    }

    override func setUpWithError() throws {
        input = ["W5",
                 "F63",
                 "S1",
                 "L90",
                 "F89",
                 "W4",
                 "F45",
                 "W4",
                 "F71",
                 "R90",
                 "S4",
                 "F16",
                 "E5",
                 "R90",
                 "S5",
                 "F94",
                 "S4",
                 "W5",
                 "F66",
                 "N3",
                 "W1",
                 "R90",
                 "F13",
                 "R180",
                 "W5",
                 "F58",
                 "E2",
                 "R270",
                 "F72",
                 "L90",
                 "S2",
                 "L90",
                 "N3",
                 "W5",
                 "F90",
                 "S2",
                 "F86",
                 "L90",
                 "F72",
                 "N4",
                 "W5",
                 "N1",
                 "W3",
                 "N2",
                 "E1",
                 "S5",
                 "R90",
                 "F11",
                 "W2",
                 "R90",
                 "F58",
                 "S5",
                 "F64",
                 "R180",
                 "E4",
                 "N5",
                 "F53",
                 "R90",
                 "W5",
                 "N3",
                 "F39",
                 "S3",
                 "R180",
                 "N2",
                 "E4",
                 "L90",
                 "W1",
                 "R90",
                 "S1",
                 "R90",
                 "F40",
                 "E1",
                 "F95",
                 "W2",
                 "R90",
                 "S5",
                 "F41",
                 "L270",
                 "N4",
                 "L90",
                 "E3",
                 "S2",
                 "E5",
                 "L180",
                 "F38",
                 "S5",
                 "E3",
                 "L90",
                 "W3",
                 "S4",
                 "L180",
                 "S5",
                 "F33",
                 "W2",
                 "R90",
                 "R90",
                 "F95",
                 "E2",
                 "F96",
                 "R90",
                 "F15",
                 "L90",
                 "N2",
                 "R90",
                 "N1",
                 "F69",
                 "R180",
                 "N5",
                 "L90",
                 "F53",
                 "L180",
                 "W1",
                 "L90",
                 "S1",
                 "L180",
                 "S2",
                 "N4",
                 "N2",
                 "F51",
                 "W1",
                 "F17",
                 "W1",
                 "R180",
                 "W5",
                 "S4",
                 "R180",
                 "F87",
                 "N2",
                 "W3",
                 "F26",
                 "L90",
                 "E4",
                 "N1",
                 "F62",
                 "N5",
                 "R90",
                 "F53",
                 "N4",
                 "R90",
                 "N3",
                 "L180",
                 "W3",
                 "N4",
                 "R90",
                 "S1",
                 "W2",
                 "L90",
                 "W2",
                 "S2",
                 "R90",
                 "W1",
                 "F50",
                 "R180",
                 "F84",
                 "L90",
                 "F12",
                 "R180",
                 "F26",
                 "W5",
                 "N3",
                 "R90",
                 "S1",
                 "F3",
                 "N4",
                 "E3",
                 "R180",
                 "W1",
                 "N5",
                 "W1",
                 "W4",
                 "F89",
                 "L270",
                 "W4",
                 "L180",
                 "N4",
                 "F83",
                 "W2",
                 "F45",
                 "L90",
                 "F79",
                 "W2",
                 "R90",
                 "W1",
                 "N4",
                 "L90",
                 "W1",
                 "N1",
                 "F56",
                 "N5",
                 "W2",
                 "N3",
                 "L90",
                 "W3",
                 "N5",
                 "F49",
                 "F4",
                 "S2",
                 "F93",
                 "N1",
                 "R90",
                 "N3",
                 "W3",
                 "F29",
                 "S1",
                 "N5",
                 "F54",
                 "N5",
                 "R180",
                 "F92",
                 "E1",
                 "L90",
                 "W3",
                 "L270",
                 "E4",
                 "L180",
                 "S5",
                 "E2",
                 "F84",
                 "L180",
                 "N4",
                 "F14",
                 "F60",
                 "N2",
                 "F98",
                 "L270",
                 "F61",
                 "N3",
                 "F39",
                 "E5",
                 "L180",
                 "W4",
                 "N2",
                 "R90",
                 "F71",
                 "S4",
                 "L90",
                 "L90",
                 "S1",
                 "F15",
                 "L90",
                 "E2",
                 "F73",
                 "N4",
                 "F92",
                 "S5",
                 "W2",
                 "N4",
                 "R90",
                 "S1",
                 "F29",
                 "E4",
                 "S4",
                 "F9",
                 "E4",
                 "F10",
                 "W3",
                 "S1",
                 "F55",
                 "S5",
                 "F88",
                 "F94",
                 "L180",
                 "F99",
                 "N2",
                 "W4",
                 "F87",
                 "E5",
                 "S1",
                 "L180",
                 "S1",
                 "L90",
                 "W3",
                 "N1",
                 "W5",
                 "F50",
                 "W2",
                 "S2",
                 "F61",
                 "N1",
                 "W3",
                 "R90",
                 "F7",
                 "W1",
                 "L90",
                 "E2",
                 "R90",
                 "L90",
                 "W5",
                 "S4",
                 "R90",
                 "S1",
                 "F70",
                 "W3",
                 "F72",
                 "S5",
                 "L90",
                 "E5",
                 "F87",
                 "L90",
                 "F64",
                 "S2",
                 "F35",
                 "L90",
                 "N5",
                 "R90",
                 "N5",
                 "W4",
                 "L90",
                 "F41",
                 "L90",
                 "E4",
                 "N2",
                 "F84",
                 "R90",
                 "F67",
                 "S4",
                 "E3",
                 "F70",
                 "E5",
                 "L90",
                 "F98",
                 "N4",
                 "W2",
                 "L90",
                 "E2",
                 "F31",
                 "N3",
                 "W2",
                 "F80",
                 "S5",
                 "F43",
                 "S1",
                 "E2",
                 "L90",
                 "F61",
                 "E2",
                 "L90",
                 "F56",
                 "L90",
                 "N4",
                 "W5",
                 "L180",
                 "W2",
                 "F19",
                 "N4",
                 "F90",
                 "N4",
                 "W2",
                 "R90",
                 "F27",
                 "S5",
                 "F3",
                 "N2",
                 "R90",
                 "W1",
                 "S1",
                 "F48",
                 "S3",
                 "F61",
                 "R270",
                 "F76",
                 "S4",
                 "L180",
                 "N4",
                 "W1",
                 "F34",
                 "E1",
                 "L90",
                 "F62",
                 "W1",
                 "F37",
                 "S1",
                 "L90",
                 "N5",
                 "F25",
                 "N4",
                 "E1",
                 "L90",
                 "F98",
                 "N4",
                 "E5",
                 "R90",
                 "F19",
                 "R180",
                 "E4",
                 "F74",
                 "E4",
                 "N3",
                 "W1",
                 "F86",
                 "W5",
                 "F85",
                 "E1",
                 "E2",
                 "S2",
                 "F79",
                 "R90",
                 "W5",
                 "S3",
                 "L90",
                 "S2",
                 "F43",
                 "L180",
                 "E4",
                 "F64",
                 "L180",
                 "N1",
                 "W1",
                 "S4",
                 "E3",
                 "L180",
                 "N2",
                 "W4",
                 "R90",
                 "F63",
                 "L90",
                 "S5",
                 "W5",
                 "F27",
                 "L90",
                 "F38",
                 "L90",
                 "W1",
                 "F18",
                 "N5",
                 "S2",
                 "E5",
                 "F54",
                 "E2",
                 "F68",
                 "F40",
                 "S5",
                 "F7",
                 "N3",
                 "E1",
                 "L90",
                 "N2",
                 "W3",
                 "F22",
                 "L90",
                 "W3",
                 "R90",
                 "E2",
                 "R180",
                 "N1",
                 "L90",
                 "F36",
                 "E5",
                 "L90",
                 "E4",
                 "N5",
                 "F62",
                 "R90",
                 "E4",
                 "R180",
                 "F70",
                 "N4",
                 "F56",
                 "L90",
                 "F96",
                 "L90",
                 "N4",
                 "F70",
                 "W3",
                 "L90",
                 "F32",
                 "L90",
                 "W2",
                 "F36",
                 "S1",
                 "F85",
                 "R90",
                 "S3",
                 "R90",
                 "F77",
                 "S2",
                 "W3",
                 "R90",
                 "N2",
                 "W5",
                 "L180",
                 "F25",
                 "R180",
                 "S2",
                 "E1",
                 "L180",
                 "E2",
                 "S1",
                 "F59",
                 "N1",
                 "F57",
                 "R90",
                 "W5",
                 "L90",
                 "S1",
                 "R90",
                 "W1",
                 "R180",
                 "W1",
                 "N2",
                 "W4",
                 "F8",
                 "S2",
                 "F40",
                 "R90",
                 "F43",
                 "S3",
                 "S1",
                 "W2",
                 "F82",
                 "W1",
                 "S4",
                 "L180",
                 "F51",
                 "L180",
                 "N2",
                 "F83",
                 "L90",
                 "E1",
                 "N5",
                 "F11",
                 "W1",
                 "F2",
                 "S3",
                 "L90",
                 "W1",
                 "S2",
                 "F48",
                 "L90",
                 "E5",
                 "L180",
                 "F25",
                 "W2",
                 "F78",
                 "F78",
                 "E1",
                 "S3",
                 "W4",
                 "N4",
                 "L90",
                 "F73",
                 "S4",
                 "F91",
                 "R180",
                 "F21",
                 "N4",
                 "F9",
                 "W1",
                 "N4",
                 "L90",
                 "N4",
                 "L180",
                 "N5",
                 "E5",
                 "L90",
                 "S3",
                 "R90",
                 "W3",
                 "R90",
                 "F65",
                 "E5",
                 "E1",
                 "F10",
                 "L270",
                 "F71",
                 "E2",
                 "F10",
                 "L180",
                 "W4",
                 "S2",
                 "W2",
                 "L90",
                 "F22",
                 "W4",
                 "F41",
                 "N4",
                 "E5",
                 "R90",
                 "N1",
                 "W4",
                 "F34",
                 "R270",
                 "E5",
                 "F77",
                 "L270",
                 "R180",
                 "E5",
                 "N3",
                 "R180",
                 "E4",
                 "R90",
                 "E2",
                 "F25",
                 "F34",
                 "S3",
                 "E4",
                 "N5",
                 "W5",
                 "L90",
                 "L90",
                 "F78",
                 "L90",
                 "S1",
                 "W4",
                 "F32",
                 "E5",
                 "F54",
                 "E2",
                 "F61",
                 "E3",
                 "N4",
                 "F60",
                 "N1",
                 "R90",
                 "F4",
                 "N1",
                 "R90",
                 "E1",
                 "L180",
                 "R90",
                 "F4",
                 "E3",
                 "F4",
                 "L90",
                 "S4",
                 "W1",
                 "L90",
                 "E1",
                 "L90",
                 "S5",
                 "F30",
                 "R90",
                 "F34",
                 "N4",
                 "F95",
                 "R180",
                 "F59",
                 "R90",
                 "F47",
                 "E4",
                 "F48",
                 "L90",
                 "F59",
                 "W1",
                 "S4",
                 "F12",
                 "R90",
                 "F59",
                 "S1",
                 "F53",
                 "N5",
                 "F15",
                 "L90",
                 "F47",
                 "N3",
                 "E2",
                 "F77",
                 "R180",
                 "F59",
                 "W3",
                 "S3",
                 "F40",
                 "E4",
                 "L90",
                 "S5",
                 "F19",
                 "S1",
                 "W5",
                 "N1",
                 "L90",
                 "S2",
                 "E1",
                 "F17",
                 "L90",
                 "E1",
                 "F93",
                 "N5",
                 "F95",
                 "W1",
                 "L90",
                 "F5",
                 "E2",
                 "L270",
                 "N3",
                 "L90",
                 "E4",
                 "W2",
                 "W2",
                 "F30",
                 "W3",
                 "L90",
                 "F87",
                 "R270",
                 "N5",
                 "F51",
                 "R270",
                 "F97",
                 "E4",
                 "S5",
                 "W1",
                 "R90",
                 "W4",
                 "F84",
                 "E5",
                 "R90",
                 "W4",
                 "N1",
                 "R90",
                 "F67",
                 "L90",
                 "W2",
                 "R90",
                 "W1",
                 "S5",
                 "F17",
                 "F83",
                 "E3",
                 "L90",
                 "N1",
                 "W3",
                 "L90",
                 "F50",
                 "E1",
                 "F70",
                 "S5",
                 "F35",
                 "R270",
                 "N4",
                 "W3",
                 "S2",
                 "L90",
                 "S1",
                 "E1",
                 "L90",
                 "S1",
                 "R180",
                 "F32",
                 "W5",
                 "N5",
                 "W3",
                 "R90",
                 "S4",
                 "F51",
                 "R180",
                 "F89",
                 "S4",
                 "L90",
                 "F14",
                 "S4",
                 "L180",
                 "W2",
                 "R90",
                 "F25",
                 "W5",
                 "F44",
                 "W3",
                 "L180",
                 "F27",
                 "W3",
                 "L180",
                 "L180",
                 "F52",
                 "N3",
                 "W1",
                 "N1",
                 "F4",
                 "E2",
                 "R90",
                 "F52",
                 "L90",
                 "F94",
                 "L90",
                 "F13",
        ]
    }

    override func tearDownWithError() throws {

    }
}
