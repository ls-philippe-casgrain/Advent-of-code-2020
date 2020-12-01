//
//  day01.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-01.
//

import Foundation

struct ExpenseReport {
    let input: [Int]

    func value2020() -> (Int, Int) {
        // First build a dictionary of keys by subtracting 2020 from all values
        // The key will be the result of the subtraction
        // The value will simply be the index in the array
        var dict: [Int:Int] = [:]
        for i in 0 ..< input.count {
            let key = 2020 - input[i]
            dict[key] = i
        }
        // Then we loop over values in the array to look for keys
        for value in input {
            if let indexOfAnswer = dict[value] {
                // We found a matching value, just extract it using the index
                return (value, input[indexOfAnswer])
            }
        }
        // Nothing found
        return (0, 0)
    }

    func repair() -> Int {
        let (val1, val2) = value2020()
        return val1 * val2
    }

    func value3_2020() -> (Int, Int, Int) {
        var dict: [Int:Int] = [:]
        for i in 0 ..< input.count {
            let key = 2020 - input[i]
            dict[key] = i
        }
        for i in 0 ..< input.count {
            for j in i + 1 ..< input.count {
                let sum = input[i] + input[j]
                if let indexOfAnswer = dict[sum] {
                    return (input[i], input[j], input[indexOfAnswer])
                }
            }
        }
        return (0, 0, 0)
    }

    func repair3() -> Int {
        let (val1, val2, val3) = value3_2020()
        return val1 * val2 * val3
    }
}
