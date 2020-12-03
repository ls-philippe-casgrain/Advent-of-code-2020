//
//  day03.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-03.
//

import Foundation

struct TreeMap {

    let input: [String]

    func numTrees(right: Int, down: Int) -> Int {
        var count = 0
        var rightPos = 0

        for i in 1 ..< input.count where i % down == 0 {
            let line = input[i]
            let width = line.count // should be the same for each line
            // Move right
            rightPos += right
            let posInLine = rightPos % width
            let isTree = line[line.index(line.startIndex, offsetBy: posInLine)] == "#"
            if isTree {
                count += 1
            }
        }

        return count
    }
}
