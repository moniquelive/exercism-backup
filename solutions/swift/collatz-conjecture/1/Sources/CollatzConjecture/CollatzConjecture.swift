enum CollatzConjectureError: Error { case negative }

class CollatzConjecture {
  static func steps(_ number: Int) throws -> Int? {
    guard number > 0 else { throw CollatzConjectureError.negative }

    var steps = 0
    var number = number
    while number > 1 {
      number =
        number.isMultiple(of: 2)
        ? number / 2
        : number * 3 + 1
      steps += 1
    }
    return steps
  }
}
