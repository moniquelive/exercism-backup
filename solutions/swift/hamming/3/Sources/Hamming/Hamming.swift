enum HammingError: Error { case sizeMismatch }

func compute(_ dnaSequence: String, against: String) throws -> Int? {
  guard against.count == dnaSequence.count else { throw HammingError.sizeMismatch }

  return zip(dnaSequence, against).filter(!=).count
}
