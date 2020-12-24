//
//  day24.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-24.
//

import Foundation

struct Coords: Hashable {
    var x: Int
    var y: Int
    var z: Int
}

struct Floor {
    let input: String

    private func extractCoords() -> Set<Coords> {

        var coordSet = Set<Coords>()

        for oneLine in input.split(separator: "\n") {
            var line = String(oneLine)
            var c = Coords(x: 0, y: 0, z: 0)
            while line.count > 0 {
                if line.starts(with: "e") {
                    c.x += 1
                    c.y -= 1
                    line = String(line.dropFirst(1))
                } else if line.starts(with: "se") {
                    c.y -= 1
                    c.z += 1
                    line = String(line.dropFirst(2))
                } else if line.starts(with: "sw") {
                    c.x -= 1
                    c.z += 1
                    line = String(line.dropFirst(2))
                } else if line.starts(with: "w") {
                    c.x -= 1
                    c.y += 1
                    line = String(line.dropFirst(1))
                } else if line.starts(with: "nw") {
                    c.y += 1
                    c.z -= 1
                    line = String(line.dropFirst(2))
                } else if line.starts(with: "ne") {
                    c.x += 1
                    c.z -= 1
                    line = String(line.dropFirst(2))
                } else {
                    fatalError("error in input, should not happen")
                }
            }
            if coordSet.contains(c) {
                coordSet.remove(c)
            } else {
                coordSet.insert(c)
            }
        }

        return coordSet
    }

    func followInstructions() -> Int {

        let coordSet = self.extractCoords()
        return coordSet.count
    }

    func gameOfLife(numIterations: Int) -> Int {

        var coordSet = self.extractCoords()

        for _ in 0 ..< numIterations {
            var updatedCoordSet = Set<Coords>()
            var allPossibleCoords = Set<Coords>()
            for oneCoord in coordSet {
                allPossibleCoords.insert(oneCoord)
                for delta in [Coords(x:  1, y: -1, z:  0),
                              Coords(x:  0, y: -1, z:  1),
                              Coords(x: -1, y:  0, z:  1),
                              Coords(x: -1, y:  1, z:  0),
                              Coords(x:  0, y:  1, z: -1),
                              Coords(x:  1, y:  0, z: -1)] {
                    allPossibleCoords.insert(Coords(x: oneCoord.x + delta.x, y: oneCoord.y + delta.y, z: oneCoord.z + delta.z))
                }
            }
            for oneCoord in allPossibleCoords {
                var neighbours = 0
                for delta in [Coords(x:  1, y: -1, z:  0),
                              Coords(x:  0, y: -1, z:  1),
                              Coords(x: -1, y:  0, z:  1),
                              Coords(x: -1, y:  1, z:  0),
                              Coords(x:  0, y:  1, z: -1),
                              Coords(x:  1, y:  0, z: -1)] {
                    if coordSet.contains(Coords(x: oneCoord.x + delta.x, y: oneCoord.y + delta.y, z: oneCoord.z + delta.z)) {
                        neighbours += 1
                    }
                }
                if coordSet.contains(oneCoord) && (1...2).contains(neighbours) {
                    updatedCoordSet.insert(oneCoord)
                }
                if !coordSet.contains(oneCoord) && neighbours == 2 {
                    updatedCoordSet.insert(oneCoord)
                }
            }
            coordSet = updatedCoordSet
        }

        return coordSet.count
    }
}
