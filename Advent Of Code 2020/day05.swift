//
//  day05.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-04.
//

import Foundation

struct BoardingPass {

    let input: String

    func row() -> Int {
        var low = 0
        var high = 127
        for i in 0 ..< 7 {
            let diff = (high + 1 - low) / 2
            if input[input.index(input.startIndex, offsetBy: i)] == "F" {
                high = high - diff
            } else {
                low = low + diff
            }
        }
        return low
    }

    func col() -> Int {
        var left = 0
        var right = 7
        for i in 7 ..< 10 {
            let diff = (right + 1 - left) / 2
            if input[input.index(input.startIndex, offsetBy: i)] == "L" {
                right = right - diff
            } else {
                left = left + diff
            }
        }
        return left
    }

    func seatID() -> Int {
        return self.row() * 8 + self.col()
    }
}

struct BoardingPasses {

    let seatIDs: [Int]

    init(input: [String]) {

        self.seatIDs = input
        .map {
            strtol($0
                .replacingOccurrences(of: "F", with: "0")
                .replacingOccurrences(of: "B", with: "1")
                .replacingOccurrences(of: "L", with: "0")
                .replacingOccurrences(of: "R", with: "1"), nil, 2)
        }
        .sorted()
    }

    func maxSeatID() -> Int {

        return self.seatIDs.last!
    }

    func missingSeatID() -> Int {

        Set((self.seatIDs.first!...self.seatIDs.last!))
            .subtracting(Set(self.seatIDs))
            .first!
    }
}
