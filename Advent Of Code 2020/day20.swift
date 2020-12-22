//
//  day20.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-20.
//

import Foundation

struct Edge {
    let data: String
    var matches: Int
}

struct Tile {
    let data: [String]
    var edges: [String : Edge]

    init(data: [String]) {
        self.data = data

        var theEdges = [String : Edge]()
        theEdges["top"] = Edge(data: data[0], matches: 0)
        theEdges["bottom"] = Edge(data: data[9], matches: 0)
        var bufferLeft = String()
        var bufferRight = String()
        for line in data {
            bufferLeft.append(contentsOf: line.prefix(1))
            bufferRight.append(contentsOf: line.suffix(1))
        }
        theEdges["left"] = Edge(data: bufferLeft, matches: 0)
        theEdges["right"] = Edge(data: bufferRight, matches: 0)

        self.edges = theEdges
    }

    func numNeighbours() -> Int {
        var total = 0
        for edge in self.edges {
            if edge.value.matches != 0 {
                total += 1
            }
        }
        return total
    }
}

struct CameraArray {
    let input: String

    func fourCornerProduct() -> Int {
        var tiles = [Int : Tile]()
        var id = 0
        var counter = 0
        var data = [String]()
        for line in input.split(separator: "\n") {
            if line.hasPrefix("\n") {
                continue
            }
            if line.hasPrefix("Tile ") {
                let startPosition = 5
                let endPosition = 1
                let start = line.index(line.startIndex, offsetBy: startPosition)
                let end = line.index(line.endIndex, offsetBy: -endPosition)
                let range = start..<end
                id = Int(line[range])!
                counter = 0
            } else {
                data.append(String(line))
                counter += 1
                if counter == 10 {
                    tiles[id] = Tile(data: data)
                    data.removeAll()
                }
            }
        }

        for tile1 in tiles {
            for tile2 in tiles {
                if tile1.key == tile2.key {
                    continue
                }
                for edge1 in tile1.value.edges {
                    for edge2 in tile2.value.edges {
                        if edge2.value.matches == 0 {
                            if edge1.value.data == edge2.value.data ||
                                String(edge1.value.data.reversed()) == edge2.value.data ||
                                edge1.value.data == String(edge2.value.data.reversed()) ||
                                edge1.value.data.reversed() == edge2.value.data.reversed(){
                                tiles[tile1.key]?.edges[edge1.key]?.matches = tile2.key
                                tiles[tile2.key]?.edges[edge2.key]?.matches = tile1.key
                                break
                            }
                        }
                    }
                }
            }
        }

        var result = 0
        for tile in tiles {
            if tile.value.numNeighbours() == 2 {
                if result == 0 {
                    result = tile.key
                } else {
                    result *= tile.key
                }
            }
        }

        return result
    }
}
