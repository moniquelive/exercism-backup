let verses: [(String, String)] = [
  ("", "horse and the hound and the horn"),
  ("belonged to", "farmer sowing his corn"),
  ("kept", "rooster that crowed in the morn"),
  ("woke", "priest all shaven and shorn"),
  ("married", "man all tattered and torn"),
  ("kissed", "maiden all forlorn"),
  ("milked", "cow with the crumpled horn"),
  ("tossed", "dog"),
  ("worried", "cat"),
  ("killed", "rat"),
  ("ate", "malt"),
  ("lay in", "house that Jack built."),
]

class House {
  static func recite(start: Int, end: Int) -> String {
    var result = ""
    for i in start - 1..<end {
      result += "This is the \(verses[verses.count - i - 1].1)"
      for verse in verses[verses.count - i..<verses.count] {
        result += " that \(verse.0) the \(verse.1)"
      }
      if i < end - 1 { result += "\n" }
    }
    return result
  }
}
