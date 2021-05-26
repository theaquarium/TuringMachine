import Foundation

// General Helper Functions
func splitStringIntoParts(expression: String) -> [String] {
    return expression.split{$0 == " "}.map{ String($0) }
}

func splitStringIntoLines(expression: String) -> [String] {
    return expression.split{$0 == "\n"}.map{ String($0) }
}

// Functions to help with Tuples
func readTuples(tuplesAsString: String) -> [TTuple]{
    var ttuples = [TTuple]()
    let tuplesStringArray = splitStringIntoLines(expression: tuplesAsString)
    for t in tuplesStringArray {ttuples.append(makeTTupleFromString(t))}
    return ttuples
}

private func makeTTupleFromString(_ data: String) -> TTuple {
    let elements = splitStringIntoParts(expression: data)
    
    let currentState = Int(elements[0])!
    let newState = Int(elements[2])!
    let inputChar = elements[1].first!
    let outputChar = elements[3].first!
    let directionAsChar = elements[4]
    
    let direction: Direction = (directionAsChar == "l") || (directionAsChar == "L") ? .left : .right
    return TTuple(currentState: currentState, inputChar: inputChar, newState: newState, outputChar: outputChar, direction: direction)
}

// Formatting functions
func fitD(_ d: Date, _ size: Int, right: Bool = false) -> String{
    let df = DateFormatter()
    df.dateFormat = "MM-dd-yyyy"
    let dAsString = df.string(from: d)
    return fit(dAsString, size , right: right)
}

func fitI(_ i: Int, _ size: Int, right: Bool = false) -> String{
    let iAsString = "\(i)"
    let newLength = iAsString.count
    return fit(iAsString, newLength > size ? newLength : size , right: right)
}

func fit(_ s: String, _ size: Int, right: Bool = true) -> String{
    var result = ""
    let sSize = s.count
    if sSize == size {return s}
    var count = 0
    if size < sSize {
    for c in s {
    if count < size {result.append(c)}
    count += 1
    }
    return result
    }
    result = s
    var addon = ""
    let num = size - sSize
    for _ in 0..<num {addon.append(" ")}
    if right {return result + addon}
    return addon + result
}