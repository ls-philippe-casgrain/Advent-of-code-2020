//
//  day09.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-09.
//

import Foundation

struct XMAS {
    var input: [Int]

    func findSum(val: Int, start: Int, end: Int) -> Bool {
        for i in start ... end - 1 {
            for j in i + 1 ... end {
                if input[i] + input[j] == val {
                    return true
                }
            }
        }
        return false
    }

    func notSum(preamble: Int) -> Int {

        for i in preamble ..< input.count {
            if findSum(val: input[i], start: i - preamble, end: i - 1) {
                continue
            }
            return input[i]
        }
        
        return 0
    }

    func weakness(preamble: Int) -> Int {
        let notSum = self.notSum(preamble: preamble)

        for i in 0 ..< input.count - 1 {
            var val = [Int]()
            val.append(input[i])
            var j = i + 1
            while val.reduce(0, +) < notSum {
                val.append(input[j])
                j = j + 1
            }
            if val.reduce(0, +) == notSum {
                return val.min()! + val.max()!
            }
        }

        return 0
    }
}
