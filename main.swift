let binaryInverter = """
0 _ 0 _ r
0 0 1 1 r
0 1 1 0 r
1 1 1 0 r
1 0 1 1 r
"""

let numberCopier = """
0 _ 0 _ r
0 1 2 x r
2 1 2 1 r
2 _ 3 _ r
3 1 3 1 r
3 _ 4 1 l
4 1 4 1 l
4 _ 5 _ l
5 1 6 1 l
5 x 7 1 l
7 x 7 1 l
6 1 6 1 l
6 x 0 x r
"""

let adder = """
0 _ 0 _ r
0 1 1 x r
1 1 1 1 r
1 _ 2 _ r
2 1 2 1 r
2 _ 3 _ r
3 1 3 1 r
3 _ 4 1 l
4 1 4 1 l
4 _ 5 _ l
5 x 10 1 r
5 1 6 1 l
6 1 6 1 l
6 _ 7 _ l
6 x 9 1 r
7 1 8 1 l
7 x 9 1 r
8 1 8 1 l
8 x 0 1 r
9 _ 9 _ r
9 1 2 x r
"""

let startingTape = "_111_1111_____________"

func simpleTuringRun() {
    let program =  adder

    let tuplesArray = readTuples(tuplesAsString: program)
    var tvm = TuringVM(ttuplesArray: tuplesArray)
    let result = tvm.runTuring(initialTape: startingTape, initialState: 0, initialHead: 0)
    print("Tuples:")
    print(tvm.nakedTupleReport())
    print("Initial String: \"\(startingTape)\" Initial State: 0 Initial Head Position: 0")
    print("\n*Running Turing*\n")
    print("Number Steps In Run: \(result.numberSteps)")
    print("Final Tape: \(result.finalTape)")
    print("\nTrace:")
    for line in result.trace {
        print("" + line)
    }
}
simpleTuringRun()