struct TTuple : CustomStringConvertible{
    let currentState: Int
    let inputChar: Character
    let newState: Int
    let outputChar: Character
    let direction: Direction

    // Method For Extra Credit
    init(tupleString: String) {
        let elements = splitStringIntoParts(expression: tupleString)
    
        currentState = Int(elements[0])!
        newState = Int(elements[2])!
        inputChar = elements[1].first!
        outputChar = elements[3].first!
        let directionAsChar = elements[4]
        direction = (directionAsChar == "l") || (directionAsChar == "L") ? .left : .right
    }
    
    static func makeKey(state: Int, inputChar: Character)->String{
        return "\(state) \(inputChar)"
    }

    func getKey()->String{
        return TTuple.makeKey(state: currentState, inputChar: inputChar)
    }

    init(currentState: Int, inputChar: Character, newState: Int, outputChar: Character, direction: Direction){
        self.currentState = currentState
        self.inputChar = inputChar
        self.newState = newState
        self.outputChar = outputChar
        self.direction = direction
    }

    var description: String {
        return "cs: \(currentState) ic: \(inputChar) ns: \(newState) oc: \(outputChar) di: \(direction)"
    }

    func nakedTuple()->String {
        var result = ""
        result += "\(currentState)  "
        result += "\(inputChar)  "
        result += "\(newState)  "
        result += "\(outputChar)  "
        result += (direction == .left) ? "l" : "r"
        return result
    }
}