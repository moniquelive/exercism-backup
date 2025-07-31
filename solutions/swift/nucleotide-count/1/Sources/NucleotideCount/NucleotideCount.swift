enum NucleotideCountErrors: Error { case invalidNucleotide }

class DNA {
  var count = ["C": 0, "G": 0, "A": 0, "T": 0]

  init(strand: String) throws {
    for s in strand {
      switch s {
      case "C": count["C"]! += 1
      case "G": count["G"]! += 1
      case "A": count["A"]! += 1
      case "T": count["T"]! += 1
      default: throw NucleotideCountErrors.invalidNucleotide
      }
    }
  }

  func counts() -> [String: Int] { count }
}
