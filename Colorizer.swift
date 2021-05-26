// https://github.com/paulot/Colors

struct Colorizer {
    private static func colorNormalText(_ color: Int) -> ((String) -> String) {
        return apply(style: getColor(color: [color, 9], mod: 30))
    }

    static func apply<T>(style: [T]) -> ((String) -> String) {
        return { str in return "\u{001B}[\(style[0])m\(str)\u{001B}[\(style[1])m" }
    }

    static func getColor(color: [Int], mod: Int) -> [Int] {
        let terminator = mod == 30 || mod == 90 ? 30 : 40
        return [ color[0] + mod, color[1] + terminator ]
    }

    public static let black = colorNormalText(0)
    public static let red = colorNormalText(1)
    public static let green = colorNormalText(2)
    public static let yellow = colorNormalText(3)
    public static let blue = colorNormalText(4)
    public static let magenta = colorNormalText(5)
    public static let cyan = colorNormalText(6)
    public static let white = colorNormalText(7)
}