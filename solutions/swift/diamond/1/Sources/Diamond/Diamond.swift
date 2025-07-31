class Diamond {
  static func makeDiamond(letter: Character) -> [String] {
    guard let asciiValue = letter.asciiValue,
      let aAscii = Character("A").asciiValue
    else { return [] }

    let delta = Int(asciiValue - aAscii + 1)
    let top = (0..<delta).map { line(width: delta, index: $0) }
    let bottom = (0..<delta - 1).reversed().map { line(width: delta, index: $0) }

    return top + bottom
  }

  private static func line(width: Int, index: Int) -> String {
    let spcBefore = String(repeating: " ", count: width - index - 1)
    let spcAfter = String(repeating: " ", count: index)

    let chAscii = Character(UnicodeScalar(Character("A").asciiValue! + UInt8(index)))
    let half = "\(spcBefore)\(chAscii)\(spcAfter)"
    let mirrored = String(half.dropLast().reversed())
    return half + mirrored
  }
}
