//
//  day22.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-22.
//

import Foundation

struct TwoDecks: Hashable {
    let deck1: [Int]
    let deck2: [Int]
}

struct CrabGame {
    var player1 = [Int]()
    var player2 = [Int]()

    init(player1: String, player2: String) {
        for line in player1.split(separator: "\n") {
            self.player1.append(Int(line)!)
        }
        for line in player2.split(separator: "\n") {
            self.player2.append(Int(line)!)
        }
    }

    private func winner(p1: [Int], p2: [Int]) -> Int {

        let winner = p1.count > 0 ? p1 : p2
        var score = 0
        for i in 0 ..< winner.count {
            score += winner[i] * (winner.count - i)
        }

        return score
    }

    func winningScore() -> Int {

        var p1 = self.player1
        var p2 = self.player2

        while p1.count > 0 && p2.count > 0 {
            let cardA = p1.remove(at: 0)
            let cardB = p2.remove(at: 0)
            if cardA > cardB {
                p1.append(contentsOf: [cardA, cardB])
            } else {
                p2.append(contentsOf: [cardB, cardA])
            }
        }

        return self.winner(p1: p1, p2: p2)
    }

    private func combat(p1: inout [Int], p2: inout [Int]) -> Bool {
        var seen = Set<TwoDecks>()
        while p1.count > 0 && p2.count > 0 {
            let td = TwoDecks(deck1: p1, deck2: p2)
            if seen.contains(td) {
                return true
            }
            seen.insert(td)
            let cardA = p1.remove(at: 0)
            let cardB = p2.remove(at: 0)
            if p1.count >= cardA && p2.count >= cardB {
                let pre1 = p1.prefix(cardA)
                let pre2 = p2.prefix(cardB)
                var sub1 = [Int]()
                for p in pre1 {
                    sub1.append(p)
                }
                var sub2 = [Int]()
                for p in pre2 {
                    sub2.append(p)
                }
                let winner = combat(p1: &sub1, p2: &sub2)
                if winner {
                    p1.append(contentsOf: [cardA, cardB])
                } else {
                    p2.append(contentsOf: [cardB, cardA])
                }
            } else {
                if cardA > cardB {
                    p1.append(contentsOf: [cardA, cardB])
                } else {
                    p2.append(contentsOf: [cardB, cardA])
                }
            }
        }
        return p1.count > 0
    }

    func winningRecursiveScore() -> Int {

        var p1 = self.player1
        var p2 = self.player2

        _ = combat(p1: &p1, p2: &p2)
        return self.winner(p1: p1, p2: p2)
    }
}
