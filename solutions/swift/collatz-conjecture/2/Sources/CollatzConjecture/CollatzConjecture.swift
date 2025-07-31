enum CollatzConjectureError: Error { case negative }

class CollatzConjecture {
  static func steps(_ number: Int) throws -> Int {
    guard number > 0 else { throw CollatzConjectureError.negative }
    return number == 1
      ? 0
      : try steps(number % 2 == 0 ? number / 2 : number * 3 + 1) + 1
  }
}
