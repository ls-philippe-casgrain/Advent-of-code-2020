//
//  day10.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-10.
//

import Foundation

struct Adapters {
    var input: [Int]

    func useAll() -> Int {
        let sorted = input.sorted()

        var one = 0
        var three = 0
        for i in 0 ..< sorted.count {
            var prev = 0
            if i > 0 {
                prev = sorted[i - 1]
            }
            let diff = sorted[i] - prev
            if diff == 1 {
                one += 1
            } else if diff == 3 {
                three += 1
            }
        }
        three += 1

        return one * three
    }

    func combineAll() -> Int {
        var sorted = input.sorted()
        sorted.insert(0, at: 0)
        sorted.append(sorted.last! + 3)

        var ways = Array<Int>()
        for _ in 0 ..< sorted.count {
            ways.append(0)
        }
        ways[0] = 1
        ways[1] = 1
        if sorted[2] - sorted[0] <= 3 {
            ways[2] = 2
        } else {
            ways[2] = 1
        }
        for i in 3 ..< sorted.count {
            for j in 0...3 {
                if sorted[i] - sorted[i-j] <= 3 {
                    ways[i] += ways[i-j]
                }
            }
        }

        return ways.last!
    }
}
