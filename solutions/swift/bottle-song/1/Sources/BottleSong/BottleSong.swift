struct BottleSong {
  private let numbers = [
    "Ten", "Nine", "Eight", "Seven", "Six", "Five", "Four", "Three", "Two", "One", "No",
  ]
  let bottles: Int

  func song(takedown: Int) -> [String] {
    let start = 10 - bottles
    return (start..<start + takedown).reduce(into: []) { (s, i) in
      if !s.isEmpty { s.append("") }
      let b1 = (i == numbers.count - 2) ? "bottle" : "bottles"
      let b2 = (i + 1 == numbers.count - 2) ? "bottle" : "bottles"
      s.append("\(numbers[i]) green \(b1) hanging on the wall,")
      s.append(s.last!)
      s.append("And if one green bottle should accidentally fall,")
      s.append("There'll be \(numbers[i + 1].lowercased()) green \(b2) hanging on the wall.")
    }
  }
}
