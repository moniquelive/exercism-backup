struct WordCount {
  let words: String
  func count() -> [String: Int] {
    words.matches(of: /['\w]+/)
      .map { $0.0.trimmingPrefix("'") }
      .map { $0.hasSuffix("'") ? $0.dropLast() : $0 }
      .filter { !$0.isEmpty }
      .reduce(into: [:]) { $0[$1.lowercased(), default: 0] += 1 }
  }
}
