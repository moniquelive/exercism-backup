enum Classification { case perfect, abundant, deficient }
enum ClassificationError: Error { case invalidInput }

func classify(number: Int) throws -> Classification {
  guard number > 0 else { throw ClassificationError.invalidInput }
  var a = 0
  for factor in 1..<(number / 2) + 1 {
    if number % factor == 0 { a += factor }
    if a > number { return .abundant }
  }
  return a < number ? .deficient : .perfect
}
