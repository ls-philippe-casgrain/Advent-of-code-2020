//
//  day23.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-23.
//

import Foundation

struct CrabChallenge {
    var cups = [Int]()
    var nextCup = [Int : Int]()
    var current = 0

    init(input: String, total: Int) {
        // Convert string to [Int]
        for char in input {
            if let i = Int(String(char)) {
                cups.append(i)
            }
        }

        // Add extra as necessary
        for i in cups.max()! ..< total {
            cups.append(i + 1)
        }

        for i in 0 ..< cups.count - 1 {
            nextCup[cups[i]] = cups[i + 1]
        }
        nextCup[cups[cups.count - 1]] = cups[0]
    }

    mutating func shiftThree(base: Int) {
        let c1 = self.nextCup[base]!
        let c2 = self.nextCup[c1]!
        let c3 = self.nextCup[c2]!
        let n = self.cups.count
        var d = n
        if self.current > 1 {
            d = base - 1
        }
        while [c1, c2, c3].contains(d) {
            if d > 1 {
                d = d - 1
            } else {
                d = n
            }
        }
        self.nextCup[base] = self.nextCup[c3]
        self.nextCup[c3] = self.nextCup[d]
        self.nextCup[d] = c1
    }

    mutating func cupLabels() -> String {

        self.current = cups[0]

        for _ in 0 ..< 100 {
            self.shiftThree(base: current)
            self.current = self.nextCup[current]!
        }

        var c = 1
        var s = ""
        for _ in 0 ..< nextCup.count - 1 {
            c = self.nextCup[c]!
            s.append(String(c))
        }
        return s
    }

    mutating func twoCups() -> Int {

        self.current = cups[0]

        for _ in 0 ..< 10000000 {
            self.shiftThree(base: current)
            self.current = self.nextCup[current]!
        }

        let result = self.nextCup[1]! * self.nextCup[self.nextCup[1]!]!

        return result
    }
}
