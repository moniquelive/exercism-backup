import Foundation

enum ResistorColorTrio: String, CaseIterable {
    case black, brown, red, orange, yellow, green, blue, violet, grey, white
    static func label(for colors: [String]) throws -> String {
        let (e1, e2, e3) = (
            self.init(rawValue: colors[0].lowercased())!,
            self.init(rawValue: colors[1].lowercased())!,
            self.init(rawValue: colors[2].lowercased())!
        )
        let (v1, v2, v3) = (
            allCases.firstIndex(of: e1)!, allCases.firstIndex(of: e2)!, allCases.firstIndex(of: e3)!
        )
        let val = (v1 * 10 + v2) * Int(pow(10, Double(v3)))
        if val > 1_000_000_000 { return "\(val / 1_000_000_000) gigaohms" }
        if val > 1_000_000 { return "\(val / 1_000_000) megaohms" }
        if val > 1_000 { return "\(val / 1_000) kiloohms" }
        return "\(val) ohms"
    }
}
