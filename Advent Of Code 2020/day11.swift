//
//  day11.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-10.
//

import Foundation

struct SeatLayout {
    var input: [String]

    func countSeats(_ layout: [[String]]) -> Int {
        var counter = 0
        let width = layout.first!.count
        let height = layout.count
        for i in 0 ..< width {
            for j in 0 ..< height {
                if layout[j][i] == "#" {
                    counter += 1
                }
            }
        }
        return counter
    }

    func iterate(_ previous: [[String]]) -> [[String]] {
        var next = previous

        let width = previous.first!.count
        let height = previous.count

        for i in 0 ..< width {
            for j in 0 ..< height {
                var numOccupiedNeighbours = 0
                if i > 0 {
                    if previous[j][i-1] == "#" {
                        numOccupiedNeighbours += 1
                    }
                }
                if j > 0 {
                    if previous[j-1][i] == "#" {
                        numOccupiedNeighbours += 1
                    }
                }
                if i < width - 1 {
                    if previous[j][i+1] == "#" {
                        numOccupiedNeighbours += 1
                    }
                }
                if j < height - 1 {
                    if previous[j+1][i] == "#" {
                        numOccupiedNeighbours += 1
                    }
                }
                if i > 0 && j > 0 {
                    if previous[j-1][i-1] == "#" {
                        numOccupiedNeighbours += 1
                    }
                }
                if j > 0 && i < width - 1 {
                    if previous[j-1][i+1] == "#" {
                        numOccupiedNeighbours += 1
                    }
                }
                if i < width - 1 && j < height - 1 {
                    if previous[j+1][i+1] == "#" {
                        numOccupiedNeighbours += 1
                    }
                }
                if j < height - 1 && i > 0 {
                    if previous[j+1][i-1] == "#" {
                        numOccupiedNeighbours += 1
                    }
                }

                if previous[j][i] == "L" {
                    if numOccupiedNeighbours == 0 {
                        next[j][i] = "#"
                    }
                } else if previous[j][i] == "#" {
                    if numOccupiedNeighbours >= 4 {
                        next[j][i] = "L"
                    }
                }
            }
        }

        return next
    }

    func stable() -> Int {
        var initial = [[String]]()
        for line in input {
            var lineArr = [String]()
            for char in line {
                lineArr.append(String(char))
            }
            initial.append(lineArr)
        }

        var counter = 0
        var previous = initial
        while true {
            counter = counter + 1
            let next = self.iterate(previous)
            if next == previous {
                return self.countSeats(next)
            }
            previous = next
        }
    }

    func iterate2(_ previous: [[String]]) -> [[String]] {
        var next = previous

        let width = previous.first!.count
        let height = previous.count

        for i in 0 ..< width {
            for j in 0 ..< height {
                var numOccupiedNeighbours = 0
                do {
                    let v = j
                    var h = i - 1
                    var found = false
                    while !found && h >= 0 {
                        if previous[v][h] == "#" {
                            numOccupiedNeighbours += 1
                            found = true
                        } else if previous[v][h] == "L" {
                            found = true
                        }
                        h = h - 1
                    }
                }
                do {
                    var v = j - 1
                    var h = i - 1
                    var found = false
                    while !found && h >= 0 && v >= 0 {
                        if previous[v][h] == "#" {
                            numOccupiedNeighbours += 1
                            found = true
                        } else if previous[v][h] == "L" {
                            found = true
                        }
                        h = h - 1
                        v = v - 1
                    }
                }
                do {
                    var v = j - 1
                    let h = i
                    var found = false
                    while !found && v >= 0 {
                        if previous[v][h] == "#" {
                            numOccupiedNeighbours += 1
                            found = true
                        } else if previous[v][h] == "L" {
                            found = true
                        }
                        v = v - 1
                    }
                }
                do {
                    var v = j + 1
                    var h = i + 1
                    var found = false
                    while !found && h < width && v < height {
                        if previous[v][h] == "#" {
                            numOccupiedNeighbours += 1
                            found = true
                        } else if previous[v][h] == "L" {
                            found = true
                        }
                        h = h + 1
                        v = v + 1
                    }
                }
                do {
                    var v = j + 1
                    let h = i
                    var found = false
                    while !found && v < height {
                        if previous[v][h] == "#" {
                            numOccupiedNeighbours += 1
                            found = true
                        } else if previous[v][h] == "L" {
                            found = true
                        }
                        v = v + 1
                    }
                }
                do {
                    let v = j
                    var h = i + 1
                    var found = false
                    while !found && h < width {
                        if previous[v][h] == "#" {
                            numOccupiedNeighbours += 1
                            found = true
                        } else if previous[v][h] == "L" {
                            found = true
                        }
                        h = h + 1
                    }
                }
                do {
                    var v = j + 1
                    var h = i - 1
                    var found = false
                    while !found && h >= 0 && v < height {
                        if previous[v][h] == "#" {
                            numOccupiedNeighbours += 1
                            found = true
                        } else if previous[v][h] == "L" {
                            found = true
                        }
                        h = h - 1
                        v = v + 1
                    }
                }
                do {
                    var v = j - 1
                    var h = i + 1
                    var found = false
                    while !found && h < width && v >= 0 {
                        if previous[v][h] == "#" {
                            numOccupiedNeighbours += 1
                            found = true
                        } else if previous[v][h] == "L" {
                            found = true
                        }
                        h = h + 1
                        v = v - 1
                    }
                }

                if previous[j][i] == "L" {
                    if numOccupiedNeighbours == 0 {
                        next[j][i] = "#"
                    }
                } else if previous[j][i] == "#" {
                    if numOccupiedNeighbours >= 5 {
                        next[j][i] = "L"
                    }
                }
            }
        }

        return next
    }

    func stable2() -> Int {
        var initial = [[String]]()
        for line in input {
            var lineArr = [String]()
            for char in line {
                lineArr.append(String(char))
            }
            initial.append(lineArr)
        }

        var counter = 0
        var previous = initial
        while true {
            counter = counter + 1
            let next = self.iterate2(previous)
            if next == previous {
                return self.countSeats(next)
            }
            previous = next
        }
    }

    func prt(_ arr: [[String]]) -> String {
        var str = String()

        let width = arr.first!.count
        let height = arr.count

        for j in 0 ..< height {
            for i in 0 ..< width {
                str.append(arr[j][i])
            }
            str.append("\n")
        }
        return str
    }
}
