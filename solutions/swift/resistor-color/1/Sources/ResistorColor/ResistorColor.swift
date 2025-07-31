enum ResistorColor {
    static let colors = [
        "black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white",
    ]
    static func colorCode(for: String) throws -> Int { Self.colors.firstIndex(of: `for`) ?? -1 }
}
