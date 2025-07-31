enum ResistorColorDuo: String, CaseIterable {
    case black, brown, red, orange, yellow, green, blue, violet, grey, white
    static func value(for color: String) -> ResistorColorDuo {
        self.init(rawValue: color.lowercased())!
    }
    static func value(for colors: [String]) throws -> Int {
        let (e1, e2) = (value(for: colors[0]), value(for: colors[1]))
        let (v1, v2) = (allCases.firstIndex(of: e1)!, allCases.firstIndex(of: e2)!)
        return v1 * 10 + v2
    }
}
