//
//  day19.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-19.
//

import Foundation

struct MonsterMessage {

    let inputRules: [String]
    let inputMessages: [String]

    private func check(rules: [String: [[String]]], id: String, sample: String, start: Int) -> Set<String> {
        let rule = rules[id]
        if rule![0][0] == "" {
            if start < sample.count && rule![0][1] == String(sample[sample.index(sample.startIndex, offsetBy: start)]) {
                return [String(start + 1)]
            } else {
                return Set<String>()
            }
        } else {
            var endings = Set<String>()
            for subRule in rule! {
                var buffer: Set<String> = [String(start)]
                for part in subRule {
                    var temp = Set<String>()
                    for loc in buffer {
                        temp = temp.intersection(check(rules: rules, id: part, sample: sample, start: Int(loc)!))
                    }
                    buffer = temp
                }
                endings = endings.intersection(buffer)
            }
            return endings
        }

    }

    func matching() -> Int {
        var rules = [String: [[String]]]()
        for oneRule in inputRules {
            let data = oneRule.split(separator: ":")
            let id = String(data[0])
            let subRules = data[1].split(separator: "|")
            var content = [[String]]()
            for subRule in subRules {
                var third = [String]()
                for t in subRule.split(separator: " ") {
                    third.append(String(t))
                }
                content.append(third)
            }
            rules[id] = content
        }

        var results = [Bool]()
        for sample in inputMessages {
            let oneResult = check(rules: rules, id: "0", sample: sample, start: 0).contains(String(sample.count))
            results.append(oneResult)
        }

        return results.count
    }

}
