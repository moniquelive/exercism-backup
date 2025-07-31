enum Plant: Character {
  case clover = "C"
  case grass = "G"
  case radishes = "R"
  case violets = "V"
}

class Garden {
  let rows: [[Character]]
  init(_ diagram: String) { rows = diagram.split(separator: "\n").map(Array.init) }

  func plantsForChild(_ child: String) -> [Plant] {
    let index = Int(child.first!.asciiValue! - 65)
    return [
      Plant(rawValue: rows[0][2 * index])!,
      Plant(rawValue: rows[0][2 * index + 1])!,
      Plant(rawValue: rows[1][2 * index])!,
      Plant(rawValue: rows[1][2 * index + 1])!,
    ]
  }
}
