//
//  day14.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-13.
//

import Foundation

struct Program {

    var input: [String]

    func binaryToInt(binaryString: String) -> Int {
      return strtol(binaryString, nil, 2)
    }

    func sumAll() -> Int {

        var mask = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
        var maskOr = 0b000000000000000000000000000000000000
        var maskAnd = 0b111111111111111111111111111111111111
        var dict = [Int : Int]()
        for line in input {
            let trim = line.replacingOccurrences(of: " = ", with: "=")
            let split = trim.split(separator: "=")
            let command = String(split[0])
            let address = String(split[1])
            if command == "mask" {
                mask = address
                let maskOrStr = mask/*.replacingOccurrences(of: "0", with: "1")*/.replacingOccurrences(of: "X", with: "0")
                let maskAndStr = mask/*.replacingOccurrences(of: "1", with: "0")*/.replacingOccurrences(of: "X", with: "1")
                maskOr = binaryToInt(binaryString: maskOrStr)
                maskAnd = binaryToInt(binaryString: maskAndStr)
            } else {
                let addr = Int(command[command.index(command.startIndex, offsetBy: 4)..<command.index(command.endIndex, offsetBy: -1)])
                let valToAdd = Int(address)
                dict[addr!] = (valToAdd! | maskOr) & maskAnd
            }
        }

        return dict.reduce(into: 0) { (result, element) in
            result += element.value
        }
    }

}
