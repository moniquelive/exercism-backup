enum HammingError: Error { case invalidInput, emptyInput }

func compute(_ dnaSequence: String, against: String) throws -> Int? {
  guard
    (dnaSequence.isEmpty && against.isEmpty)
      || !(dnaSequence.isEmpty || against.isEmpty)
  else { throw HammingError.emptyInput }

  guard against.count == dnaSequence.count else { throw HammingError.invalidInput }

  return zip(dnaSequence, against).reduce(0) { $0 + ($1.0 == $1.1 ? 0 : 1) }
}
