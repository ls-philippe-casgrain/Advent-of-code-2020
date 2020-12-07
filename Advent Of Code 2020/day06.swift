//
//  day06.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-06.
//

import Foundation

struct CustomsForm {

    let input: [String]

    func sumCounts() -> Int {
        var total = 0
        for form in input {
            let answers = form.split(separator: ",")
            let letters = answers.joined()
            let s = Set(letters)
            total += s.count
        }
        return total
    }

    func sumCountsNewRule() -> Int {
        var total = 0
        for form in input {
            let answers = form.split(separator: ",")
            let rpt = answers.count
            let letters = answers.joined()
            for char in "abcdefghijklmnopqrstuvwxyz" {
                let charCount = letters.filter { $0 == char }.count
                if charCount == rpt {
                    total += 1
                }
            }
        }
        return total
    }
}
