class Proverb {
  private(set) var result = ""

  init(_ words: [String]) {
    guard !words.isEmpty else { return }
    for i in 1..<words.count {
      result += "For want of a \(words[i-1]) the \(words[i]) was lost.\n"
    }
    result += "And all for the want of a \(words[0])."
  }

  func recite() -> String { result }
}
