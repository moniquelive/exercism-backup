class IsbnVerifier {
  static func isValid(_ s: String) -> Bool {
    guard s.allSatisfy({ c in c.isWholeNumber || c == "X" || "- ".contains(c) }) else {
      return false
    }
    let clean = s.filter { $0.isWholeNumber || $0 == "X" }
    return clean.count == 10
      && clean.dropLast().allSatisfy(\.isWholeNumber)
      && zip(clean, stride(from: 10, through: 1, by: -1))
        .map { ($0 == "X" ? 10 : $0.wholeNumberValue!) * $1 }
        .reduce(0, +) % 11 == 0
  }
}
