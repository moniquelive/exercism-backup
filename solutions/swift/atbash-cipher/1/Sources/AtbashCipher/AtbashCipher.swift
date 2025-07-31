import Foundation

class AtbashCipher {
  static let ascii_a = Character("a").asciiValue!
  static let ascii_z = Character("z").asciiValue!
  static func encdec(_ enc: Bool, _ phrase: String) -> String {
    var result = ""
    for ch in phrase {
      if ch.isNumber { result.append(ch) }
      if ch.isLetter {
        result.append(
          String(
            bytes: [ascii_z - (Character(ch.lowercased()).asciiValue! - ascii_a)],
            encoding: .ascii
          )!
        )
      }
      if enc && result.count % 6 == 5 { result.append(" ") }
    }
    if result.hasSuffix(" ") { result.removeLast() }
    return result
  }
  static func encode(_ phrase: String) -> String { encdec(true, phrase) }
  static func decode(_ phrase: String) -> String { encdec(false, phrase) }
}
