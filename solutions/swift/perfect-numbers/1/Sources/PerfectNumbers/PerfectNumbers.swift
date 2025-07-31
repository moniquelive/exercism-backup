enum Classification { case perfect, abundant, deficient }
enum ClassificationError: Error { case invalidInput }

func classify(number: Int) throws -> Classification {
  guard number > 0 else { throw ClassificationError.invalidInput }

  let aliquot =
    [Int](1..<(number / 2) + 1)
    .filter { number.isMultiple(of: $0) }
    .reduce(0, +)
  return aliquot < number ? .deficient : aliquot > number ? .abundant : .perfect
}
