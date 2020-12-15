//
//  day15.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-15.
//

import Foundation

struct MemoryGame {
    var input: String

    func play(until turn: Int) -> Int {
        let arr = input.split(separator: ",")
        var num = arr.map { Int($0)! }
        var dict = [Int:Int]()
        for i in 0 ..< num.count {
            dict[num[i]] = i
        }
        for i in num.count ..< turn {
            let prevNum = num[i - 1]
            var diff = 0
            if let d = dict[prevNum] {
                diff = i - d - 1
            }
            dict[prevNum] = i - 1
            num.append(diff)
        }

        return num[turn - 1]
    }
}
