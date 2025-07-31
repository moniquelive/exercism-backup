class WordCount {
  private(set) var bag = [String: Int]()
  init(words: String) {
    for word in words.lowercased().matches(of: /(['\w]+)/) {
      var word = String(word.output.0)
      word.trimPrefix("'")
      if word.hasSuffix("'") { word.removeLast() }
      guard !word.isEmpty else { continue }
      bag[word] = bag[word, default: 0] + 1
    }
  }
  func count() -> [String: Int] { bag }
}
