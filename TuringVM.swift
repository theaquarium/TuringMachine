struct TuringVM {
    private(set) var numberTuples: Int = 0
    let tuples: [String: TTuple]
    var tape = [Character]() // Empty tape
    var headPos = 0
    var state = 0

    init(ttuplesArray: [TTuple]) {
        numberTuples = ttuplesArray.count

        var tupleDict = [String: TTuple]()
        for tuple in ttuplesArray {
            tupleDict[tuple.getKey()] = tuple
        }
        tuples = tupleDict
    }

    func tupleReport() -> String {
        var result = ""
        for (_, tuple) in tuples {
            result += "\(tuple)\n"
        }
        return result
    }

    func nakedTupleReport() -> String {
        var result = "cs ic ns oc di\n"

        for (_, tuple) in tuples {
            result += "\(tuple.nakedTuple())\n"
        }
        return result
    }

    func tapeAsString() -> String {
        var result = ""
        for i in 0..<tape.count {
            if i == headPos {
                result += Colorizer.cyan("[\(tape[i])]")
            } else {
                result += String(tape[i])
            }
        }
        return result
    }

    static func tapeStringToArray(_ tapeString: String) -> [Character] {
        var result = [Character]()
        for c in tapeString {
            result.append(c)
        }
        return result
    }

    private func findTuple(cs: Int, ic: Character) -> TTuple? {
        let desiredTupleKey = "\(cs) \(ic)"
        return tuples[desiredTupleKey]
    }

    mutating func runTuring(initialTape: String, initialState: Int, initialHead: Int) -> (numberSteps: Int, finalTape: String, trace: [String]) {
        var trace = [String]()
        var numberSteps = 0
        tape = TuringVM.tapeStringToArray(initialTape)
        state = initialState
        headPos = initialHead

        var currentTuple = findTuple(cs: state, ic: tape[headPos])
        while currentTuple != nil {
            numberSteps += 1

            state = currentTuple!.newState
            tape[headPos] = currentTuple!.outputChar
            headPos += currentTuple!.direction == .right ? 1 : -1

            trace.append("\(numberSteps): {\(currentTuple!)} \(tapeAsString())")

            // Debugging
            if headPos < 0 || headPos >= tape.count {
                print(Colorizer.red("FATAL ERROR: OUT OF TAPE RANGE"))
                return (numberSteps, tapeAsString(), trace)
            }
            
            currentTuple = findTuple(cs: state, ic: tape[headPos])
        }

        return (numberSteps, tapeAsString(), trace)
    }
}