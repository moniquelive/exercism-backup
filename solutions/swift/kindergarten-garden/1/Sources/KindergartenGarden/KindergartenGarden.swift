enum Plants {
  case clover, grass, radishes, violets
  init(_ ch: Character) {
    switch ch.lowercased() {
    case "c": self = .clover
    case "g": self = .grass
    case "r": self = .radishes
    case "v": self = .violets
    default: fatalError("Unknown plant '\(ch)'")
    }
  }
}

class Garden {
  let rows: [[Character]]

  init(_ diagram: String) {
    rows = diagram.split(separator: "\n").map(Array.init)
    precondition(rows.count == 2)
  }

  func plantsForChild(_ child: String) -> [Plants] {
    let index = Int((child.first!.asciiValue!) - Character("A").asciiValue!)
    return [
      Plants(rows[0][2 * index]),
      Plants(rows[0][2 * index + 1]),
      Plants(rows[1][2 * index]),
      Plants(rows[1][2 * index + 1]),
    ]
  }
}
