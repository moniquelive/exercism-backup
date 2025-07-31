class IsbnVerifier {
  static func isValid(_ s: String) -> Bool {
    let clean = s.filter { $0 != "-" }
    guard clean.count == 10, clean.prefix(9).allSatisfy(\.isNumber),
      "0123456789X".contains(clean.last!)
    else { return false }
    return
      clean
      .enumerated()
      .map { $1 == "X" ? 10 : Int(String($1))! * (10 - $0) }
      .reduce(0, +) % 11 == 0
  }
}
