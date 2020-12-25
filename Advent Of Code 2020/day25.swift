//
//  day25.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-25.
//

import Foundation

struct RoomEntry {

    func privateKey(cardPublic: Int64, doorPublic: Int64) -> Int {

        let modulus: Int64 = 20201227
        var count: Int64 = 0
        var n: Int64 = 1
        let subjectNumber: Int64 = 7
        while n != cardPublic {
            n *= subjectNumber
            n %= modulus
            count += 1
        }

        var pow = doorPublic
        for _ in 1 ..< count { // Start at 1 because we're mimicking `pow`
            pow *= doorPublic
            pow %= modulus
        }

        return Int(pow)
    }
}
