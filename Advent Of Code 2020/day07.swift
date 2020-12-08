//
//  day07.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-06.
//

import Foundation

struct LuggageRules {

    let input: [String]

    func canContain(specificColor: String) -> Int {

        var rules: [String : Set<String>] = [:]
        for rule in input {
            let x = rule.components(separatedBy: " contain ")
            let containingColor = String(x[0].prefix(x[0].count - 5))
            var remain = x[1]
            remain.removeLast()
            for containedBag in remain.components(separatedBy: ", ") {
                if containedBag != "no other bags" {
                    let split = containedBag.components(separatedBy: " ")
                    let color = split[1] + " " + split[2]
                    if rules[color] == nil {
                        rules[color] = Set()
                    }
                    rules[color]?.insert(containingColor)
                }
            }
        }

        var colors: Set = [specificColor]
        var added = true
        while added {
            added = false
            let l = colors.count
            for color in colors {
                if rules[color] != nil {
                    colors = colors.union(rules[color]!)
                }
            }
            if colors.count > l {
                added = true
            }
        }

        return colors.count - 1
    }

    struct ColorNum: Hashable {
        let color: String
        let num: Int
    }

    func requiredInside(specificColor: String) -> Int {

        var rules: [String : Set<ColorNum>] = [:]
        for rule in input {
            let x = rule.components(separatedBy: " contain ")
            let containingColor = String(x[0].prefix(x[0].count - 5))
            var remain = x[1]
            remain.removeLast()
            for containedBag in remain.components(separatedBy: ", ") {
                if containedBag != "no other bags" {
                    let split = containedBag.components(separatedBy: " ")
                    let color = split[1] + " " + split[2]
                    let num = Int(split[0])
                    if rules[containingColor] == nil {
                        rules[containingColor] = Set()
                    }
                    rules[containingColor]?.insert(ColorNum(color: color, num: num!))
                }
            }
        }

        func addColors(color: String) -> Int {
            var total = 0
            if let rulesColor = rules[color] {
                for colorNum in rulesColor {
                    total = total + colorNum.num * (1 + addColors(color: colorNum.color))
                }
            }
            return total
        }

        return addColors(color: specificColor)
    }

}
