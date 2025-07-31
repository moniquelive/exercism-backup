enum NucleotideCountErrors: Error { case invalidNucleotide }

class DNA {
  var count: [Character: Int] = ["C": 0, "G": 0, "A": 0, "T": 0]
  func counts() -> [String: Int] {
    Dictionary.init(uniqueKeysWithValues: count.map { (String($0), $1) })
  }

  init(strand: String) throws {
    for s in strand {
      guard count[s] != nil else { throw NucleotideCountErrors.invalidNucleotide }
      count[s]! += 1
    }
  }
}
