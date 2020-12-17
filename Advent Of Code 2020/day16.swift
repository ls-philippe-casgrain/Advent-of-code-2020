//
//  day16.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-16.
//

import Foundation

struct BiRange {
    let rangeA: Range<Int>
    let rangeB: Range<Int>
}

struct Notes {

    let sections: [String]
    let ticket: [Int]
    let nearby: [[Int]]

    func errorRate() -> Int {

        // Extract the rules
        var rules = [String : BiRange]()
        for section in sections {
            let top = section.split(separator: ":")
            let ranges = top[1].replacingOccurrences(of: " or ", with: "|")
                .replacingOccurrences(of: " ", with: "")
                .split(separator: "|")
            let rangeA = ranges[0].split(separator: "-")
            let rangeB = ranges[1].split(separator: "-")
            rules[String(top[0])] = BiRange(rangeA: Int(rangeA[0])!..<Int(rangeA[1])!+1, rangeB: Int(rangeB[0])!..<Int(rangeB[1])!+1)
        }

        var total = 0
        for near in nearby {
            for num in near {
                var satisfaction = 0
                for rule in rules {
                    let br = rule.value
                    if br.rangeA.contains(num) || br.rangeB.contains(num) {
                        satisfaction += 1
                    }
                }
                if satisfaction == 0 {
                    total += num
                }
            }
        }

        return total
    }

    func departure() -> Int {

        // Extract the rules
        var rules = [String : BiRange]()
        for section in sections {
            let top = section.split(separator: ":")
            let ranges = top[1].replacingOccurrences(of: " or ", with: "|")
                .replacingOccurrences(of: " ", with: "")
                .split(separator: "|")
            let rangeA = ranges[0].split(separator: "-")
            let rangeB = ranges[1].split(separator: "-")
            rules[String(top[0])] = BiRange(rangeA: Int(rangeA[0])!..<Int(rangeA[1])!+1, rangeB: Int(rangeB[0])!..<Int(rangeB[1])!+1)
        }

        var validNearby = [[Int]]()
        for near in nearby {
            var valid = true
            for num in near {
                var satisfaction = 0
                for rule in rules {
                    let br = rule.value
                    if br.rangeA.contains(num) || br.rangeB.contains(num) {
                        satisfaction += 1
                    }
                }
                if satisfaction == 0 {
                    valid = false
                }
            }
            if valid {
                validNearby.append(near)
            }
        }

        // Find set of columns that can match each rule
        var match = [String : Set<Int>]()
        for rule in rules {
            var s = Set<Int>()
            for j in 0..<self.ticket.count {
                var validCount = 0
                for i in 0..<validNearby.count {
                    let val = validNearby[i][j]
                    if rule.value.rangeA.contains(val) || rule.value.rangeB.contains(val) {
                        validCount += 1
                    }
                }
                if validCount == validNearby.count {
                    s.insert(j)
                }
            }
            match[rule.key] = s
        }

        // Reduce the sets to a unique solution
        var simplified = [String : Int]()
        let totalCount = match.count
        while simplified.count < totalCount {
            // Find the match that has only one solution
            var toRemoveKey: String = ""
            var toRemoveVal: Int = 0
            for s in match {
                if s.value.count == 1 {
                    toRemoveVal = s.value.first!
                    toRemoveKey = s.key
                    break
                }
            }
            // Save the one solution
            simplified[toRemoveKey] = toRemoveVal
            // Remove it from the match
            match.removeValue(forKey: toRemoveKey)
            // and remove it from all remaining matches
            var temp = [String : Set<Int>]()
            for var s in match {
                s.value.remove(toRemoveVal)
                temp[s.key] = s.value
            }
            match = temp
        }

        return self.ticket[simplified["departure location"]!]
            * self.ticket[simplified["departure station"]!]
            * self.ticket[simplified["departure platform"]!]
            * self.ticket[simplified["departure track"]!]
            * self.ticket[simplified["departure date"]!]
            * self.ticket[simplified["departure time"]!]
    }
}
