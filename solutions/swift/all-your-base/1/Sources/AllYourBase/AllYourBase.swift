enum BaseError: Error {
  case invalidInputBase, invalidOutputBase, negativeDigit, invalidPositiveDigit
}

struct Base {
  static func outputDigits(inputBase: Int, inputDigits: [Int], outputBase: Int) throws -> [Int] {
    guard inputBase >= 2 else { throw BaseError.invalidInputBase }
    guard outputBase >= 2 else { throw BaseError.invalidOutputBase }
    var int = 0
    for digit in inputDigits {
      guard digit >= 0 else { throw BaseError.negativeDigit }
      guard digit < inputBase else { throw BaseError.invalidPositiveDigit }
      int = int * inputBase + digit
    }
    var conv = [Int]()
    while int > 0 {
      conv.append(int % outputBase)
      int /= outputBase
    }
    return conv.isEmpty ? [0] : conv.reversed()
  }
}
