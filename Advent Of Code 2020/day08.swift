//
//  day08.swift
//  Advent Of Code 2020
//
//  Created by Philippe Casgrain on 2020-12-07.
//

import Foundation

struct Instruction {
    enum Operation {
        case nop
        case acc
        case jmp
    }

    var op: Operation
    let val: Int
    var exec: Bool = false
}

struct BootCode {
    let input: [String]

    func program() -> [Instruction] {
        var program = [Instruction]()
        for line in input {
            let split = line.split(separator: " ")
            let strOp = String(split[0]).lowercased()
            let val = Int(String(split[1]))
            var op: Instruction.Operation
            switch strOp {
            case "jmp":
                op = .jmp
            case "acc":
                op = .acc
            default:
                op = .nop
            }
            program.append(Instruction(op: op, val: val!))
        }
        return program
    }

    func _beforeInfinite(program: inout [Instruction]) -> (Int, Bool) {
        var accumulator = 0

        func recurse(instr: Instruction, pc: Int) throws -> Int {
            switch instr.op {
            case .jmp:
                let idx = pc + instr.val
                if idx >= 0 && idx < program.count {
                    return try recurse(instr: program[idx], pc: idx)
                } else {
                    return pc
                }
            default:
                return pc
            }
        }

        var counter = 0
        while counter < program.count {
            do {
                let instr = program[counter]
                let idx = try recurse(instr: instr, pc: counter)
                if program[idx].exec {
                    return (accumulator, true)
                }
                let exec = program[idx]
                switch exec.op {
                case .acc:
                    accumulator = accumulator + exec.val
                default:
                    break
                }
                program[idx].exec = true
                counter = idx + 1
            } catch {
                return (accumulator, true)
            }
        }

        return (accumulator, false)
    }

    func beforeInfinite() -> (Int, Bool) {
        var program = self.program()

        return _beforeInfinite(program: &program)
    }

    func fixProgram() -> Int {

        var program = self.program()

        for idx in 0 ..< program.count {
            for i in 0 ..< program.count {
                program[i].exec = false
            }
            let instr = program[idx]
            let oldOp = instr.op
            switch oldOp {
            case .jmp:
                program[idx].op = .nop
            case .nop:
                if instr.val != 0 {
                    program[idx].op = .jmp
                }
            default:
                break
            }
            // Run modified program
            let (result, infinite) = _beforeInfinite(program: &program)
            if (!infinite) {
                return result
            }
            program[idx].op = oldOp
        }

        return 0
    }

}
