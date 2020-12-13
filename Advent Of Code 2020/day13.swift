//
//  day13.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-13.
//

import Foundation

struct BusSchedule {
    var input: String

    func busLine(for timeStamp: Int) -> Int {

        let buses = input.split(separator: ",")
        var minTime = Int.max
        var whichBus = 0
        for bus in buses {
            if bus == "x" {
                continue
            }
            if let num = Int(bus) {
                let mult = timeStamp / num
                let above = (mult + 1) * num
                let diff = above - timeStamp
                if minTime > diff {
                    minTime = diff
                    whichBus = num
                }
            }
        }

        return whichBus * minTime
    }

//    https://rosettacode.org/wiki/Chinese_remainder_theorem#Swift
    /*
     * Function: euclid
     * Usage: (r,s) = euclid(m,n)
     * --------------------------
     * The extended Euclidean algorithm subsequently performs
     * Euclidean divisions till the remainder is zero and then
     * returns the Bézout coefficients r and s.
     */

    func euclid(_ m:Int, _ n:Int) -> (Int,Int) {
        if m % n == 0 {
            return (0,1)
        } else {
            let rs = euclid(n % m, m)
            let r = rs.1 - rs.0 * (n / m)
            let s = rs.0

            return (r,s)
        }
    }

    /*
     * Function: gcd
     * Usage: x = gcd(m,n)
     * -------------------
     * The greatest common divisor of two numbers a and b
     * is expressed by ax + by = gcd(a,b) where x and y are
     * the Bézout coefficients as determined by the extended
     * euclidean algorithm.
     */

    func gcd(_ m:Int, _ n:Int) -> Int {
        let rs = euclid(m, n)
        return m * rs.0 + n * rs.1
    }

    /*
     * Function: coprime
     * Usage: truth = coprime(m,n)
     * ---------------------------
     * If two values are coprime, their greatest common
     * divisor is 1.
     */

    func coprime(_ m:Int, _ n:Int) -> Bool {
        return gcd(m,n) == 1 ? true : false
    }

//    coprime(14,26)
    //coprime(2,4)

    /*
     * Function: crt
     * Usage: x = crt(a,n)
     * -------------------
     * The Chinese Remainder Theorem supposes that given the
     * integers n_1...n_k that are pairwise co-prime, then for
     * any sequence of integers a_1...a_k there exists an integer
     * x that solves the system of linear congruences:
     *
     *   x === a_1 (mod n_1)
     *   ...
     *   x === a_k (mod n_k)
     */

    func crt(_ a_i:[Int], _ n_i:[Int]) -> Int {
        // There is no identity operator for elements of [Int].
        // The offset of the elements of an enumerated sequence
        // can be used instead, to determine if two elements of the same
        // array are the same.
        let divs = n_i.enumerated()

        // Check if elements of n_i are pairwise coprime divs.filter{ $0.0 < n.0 }
        divs.forEach{
            n in divs.filter{ $0.0 < n.0 }.forEach{
                assert(coprime(n.1, $0.1))
            }
        }

        // Calculate factor N
        let N = n_i.map{$0}.reduce(1, *)

        // Euclidean algorithm determines s_i (and r_i)
        var s:[Int] = []

        // Using euclidean algorithm to calculate r_i, s_i
        n_i.forEach{ s += [euclid($0, N / $0).1] }

        // Solve for x
        var x = 0
        a_i.enumerated().forEach{
            x += $0.1 * s[$0.0] * N / n_i[$0.0]
        }

        // Return minimal solution
        return x % N
    }


    struct Bus {
        let num: Int
        let mod: Int
    }

    func gold() -> Int {

        let buses = input.split(separator: ",")

        var sched = [Bus]()
        for i in 0 ..< buses.count {
            if buses[i] == "x" {
                continue
            }
            let num = Int(buses[i])!
            var mod = (num - i) % num
            if (mod < 0) {
                mod = num + mod
            }
            sched.append(Bus(num: num, mod: mod))
        }

        let a = [2,3,2]
        let n = [3,5,7]

        let x = crt(a,n)
        print("crt: x = \(x) (should be 23)")

        // Can't figure out how to use CRT... brute force it is
        var result = 0

        var curBus = 0
        var counter = sched[0].num
        var increment = counter
        while true {
            let bus = sched[curBus+1]
            let div = bus.num
            let mod = bus.mod
            if counter % div == mod {
                    if curBus == sched.count - 2 {
                    result = counter
                    break
                }
                increment *= div
                curBus += 1
            }
            counter += increment
        }

        return result
    }

}
