class Proverb {
  let result: String
  init(_ words: [String]) {
    result =
      words.isEmpty
      ? ""
      : ((1..<words.count).map { "For want of a \(words[$0-1]) the \(words[$0]) was lost." } + [
        "And all for the want of a \(words[0])."
      ])
      .joined(separator: "\n")
  }

  func recite() -> String { result }
}
