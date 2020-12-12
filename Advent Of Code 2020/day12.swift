//
//  day12.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-11.
//

import Foundation

struct Navigation {
    var input: [String]

    func manhattanDistance() -> Int {

        var curDir = 0
        var east = 0
        var north = 0

        for instr in input {
            let line = instr
            let dir = line.first
            let dist = Int(line.dropFirst())!

            switch dir {
            case "N":
                north += dist
            case "S":
                north -= dist
            case "E":
                east += dist
            case "W":
                east -= dist
            case "L":
                curDir += dist
                if curDir >= 360 {
                    curDir -= 360
                }
            case "R":
                curDir -= dist
                if curDir < 0 {
                    curDir += 360
                }
            case "F":
                let heading = curDir// % 360
                if heading == 0 {
                    east += dist
                } else if heading == 90 {
                    north += dist
                } else if heading == 180 {
                    east -= dist
                } else if heading == 270 {
                    north -= dist
                }
            default:
                break
            }
        }

        return abs(east) + abs(north)
    }

    func manhattanDistance2() -> Int {

        var east = 0
        var north = 0
        var wpEast = 10
        var wpNorth = 1

        for instr in input {
            let line = instr
            let dir = line.first
            let dist = Int(line.dropFirst())!

            switch dir {
            case "N":
                wpNorth += dist
            case "S":
                wpNorth -= dist
            case "E":
                wpEast += dist
            case "W":
                wpEast -= dist
            case "L":
                switch dist {
                case 90:
                    let temp = wpEast
                    wpEast = -wpNorth
                    wpNorth = temp
                case 180:
                    wpEast = -wpEast
                    wpNorth = -wpNorth
                case 270:
                    let temp = wpEast
                    wpEast = wpNorth
                    wpNorth = -temp
                default: // 0, 360
                    break
                }
            case "R":
                switch dist {
                case 90:
                    let temp = wpEast
                    wpEast = wpNorth
                    wpNorth = -temp
                case 180:
                    wpEast = -wpEast
                    wpNorth = -wpNorth
                case 270:
                    let temp = wpEast
                    wpEast = -wpNorth
                    wpNorth = temp
                default: // 0, 360
                    break
                }
            case "F":
                east += dist * wpEast
                north += dist * wpNorth
            default:
                break
            }
        }

        return abs(east) + abs(north)
    }
}
