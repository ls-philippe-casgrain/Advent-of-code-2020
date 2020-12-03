//
//  day02.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-02.
//

import Foundation

struct Password {

    let input: [String]

    func numValid() -> Int {
        var valid: Int = 0

        for line in self.input {
            let detail = line.split(separator: " ")
            let policy = detail[0].split(separator: "-")
            let letter = detail[1].first!
            let password = detail[2]

            let min = Int(policy[0])!
            let max = Int(policy[1])!

            let count = password.reduce(0) { $1 == letter ? $0 + 1 : $0 }
            if count >= min && count <= max {
                valid = valid + 1
            }
        }

        return valid
    }

    func numValidNew() -> Int {
        var valid: Int = 0

        for line in self.input {
            let detail = line.split(separator: " ")
            let policy = detail[0].split(separator: "-")
            let letter = detail[1].first!
            let password = String(detail[2])

            let pos1 = Int(policy[0])!
            let pos2 = Int(policy[1])!

            let atPos1 = password.count >= pos1 ? password[password.index(password.startIndex, offsetBy: pos1 - 1)] == letter : false
            let atPos2 = password.count >= pos2 ? password[password.index(password.startIndex, offsetBy: pos2 - 1)] == letter : false
            if (atPos1 && !atPos2) || (!atPos1 && atPos2) {
                valid = valid + 1
            }
        }

        return valid
    }
}
