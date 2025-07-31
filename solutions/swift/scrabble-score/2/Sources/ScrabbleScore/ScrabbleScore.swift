func score(_ phrase: String) -> Int {
  var total = 0
  for ch in phrase.uppercased() {
    let score =
      switch ch {
      case "A", "E", "I", "O", "U", "L", "N", "R", "S", "T": 1
      case "D", "G": 2
      case "B", "C", "M", "P": 3
      case "F", "H", "V", "W", "Y": 4
      case "K": 5
      case "J", "X": 8
      case "Q", "Z": 10
      default: fatalError()
      }
    total += score
  }
  return total
}
