import Foundation

enum ResistorColorDuoError: Error { case colorNotFound }
enum ResistorColorDuo: Int {
    case black, brown, red, orange, yellow, green, blue, violet, grey, white

    static func stringToValue(_ color: String) throws -> ResistorColorDuo {
        switch color.lowercased() {
        case "black": .black
        case "brown": .brown
        case "red": .red
        case "orange": .orange
        case "yellow": .yellow
        case "green": .green
        case "blue": .blue
        case "violet": .violet
        case "grey": .grey
        case "white": .white
        default: throw ResistorColorDuoError.colorNotFound
        }
    }
    static func value(for colors: [String]) throws -> Int {
        let (v1, v2) = try (stringToValue(colors[0]), stringToValue(colors[1]))
        return v1.rawValue * 10 + v2.rawValue
    }
}
