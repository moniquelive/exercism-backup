import Foundation

enum ResistorColorTrio: String, CaseIterable {
    case black, brown, red, orange, yellow, green, blue, violet, grey, white
    static func label(for colors: [String]) throws -> String {
        let v = colors.map(self.init).map { allCases.firstIndex(of: $0!)! }
        let val = (v[0] * 10 + v[1]) * Int(pow(10, Double(v[2])))
        if val > 1_000_000_000 { return "\(val / 1_000_000_000) gigaohms" }
        if val > 1_000_000 { return "\(val / 1_000_000) megaohms" }
        if val > 1_000 { return "\(val / 1_000) kiloohms" }
        return "\(val) ohms"
    }
}
