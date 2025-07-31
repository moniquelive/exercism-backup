class Anagram {
  let word: String
  init(word: String) { self.word = word.lowercased() }
  func match(_ candidates: [String]) -> [String] {
    candidates.filter { $0.lowercased() != word && $0.lowercased().sorted() == word.sorted() }
  }
}
