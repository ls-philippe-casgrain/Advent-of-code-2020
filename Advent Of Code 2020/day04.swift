//
//  day04.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-04.
//

import Foundation

struct PassportBatch {

    let input: [String]

    func numValid() -> Int {
        var count = 0

        for passport in input {
            let ecl = passport.contains("ecl:")
            let pid = passport.contains("pid:")
            let eyr = passport.contains("eyr:")
            let hcl = passport.contains("hcl:")
            let byr = passport.contains("byr:")
            let iyr = passport.contains("iyr:")
            let cid = passport.contains("cid:")
            let hgt = passport.contains("hgt:")

            if ecl && pid && eyr && hcl && byr && iyr && hgt {
                count += 1
            }
        }

        return count
    }

    func numValidExtended() -> Int {
        var count = 0

        for passport in input {
            let details = passport.split(separator: " ").sorted()

            var dict = [String:String]()
            for elem in details {
                let keyVal = elem.split(separator: ":")
                dict[String(keyVal[0])] = String(keyVal[1])
            }

            let ecl = { () -> Bool in
                let val = dict["ecl"]
                return ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].contains(val)
            }
            let pid = { () -> Bool in
                let val = dict["pid"]
                let isInt = Int(val ?? "default value")
                return isInt != nil && val?.count == 9
            }
            let eyr = { () -> Bool in
                let val = dict["eyr"]
                if let intVal = Int(val ?? "default value") {
                    return intVal >= 2020 && intVal <= 2030
                }
                return false
            }
            let byr = { () -> Bool in
                let val = dict["byr"]
                if let intVal = Int(val ?? "default value") {
                    return intVal >= 1920 && intVal <= 2002
                }
                return false
            }
            let iyr = { () -> Bool in
                let val = dict["iyr"]
                if let intVal = Int(val ?? "default value") {
                    return intVal >= 2010 && intVal <= 2020
                }
                return false
            }
            let hgt = { () -> Bool in
                var val = dict["hgt"]
                let cm = val?.suffix(2) == "cm"
                let inch = val?.suffix(2) == "in"
                val?.removeLast(2)
                if let intVal = Int(val ?? "default value") {
                    if cm {
                        return intVal >= 150 && intVal <= 193
                    }
                    if inch {
                        return intVal >= 59 && intVal <= 76
                    }
                }
                return false
            }
            let hcl = { () -> Bool in
                var val = dict["hcl"]
                val?.removeFirst()
                let charset = CharacterSet(charactersIn: "abcdef0123456789")
                if let _ = val?.rangeOfCharacter(from: charset, options: .caseInsensitive, range: nil) {
                    return val?.count == 6
                }
                return false
            }

            if ecl() && pid() && eyr() && hcl() && byr() && iyr() && hgt() {
                count += 1
            }
        }

        return count
    }
}

