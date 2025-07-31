enum ResistorColorDuo: String, CaseIterable {
    case black, brown, red, orange, yellow, green, blue, violet, grey, white
    static func value(for colors: [String]) throws -> Int {
        let v = colors.map(self.init).map { allCases.firstIndex(of: $0!)! }
        return v[0] * 10 + v[1]
    }
}
