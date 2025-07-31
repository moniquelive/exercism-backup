private func rotateChar(_ base: UInt8, _ ch: UInt8, _ off: UInt8) -> UInt8 {
  base + ((ch - base + off) % 26)
}
func rotateCipher(_ input: String, shift: UInt8) -> String {
  let lowerA: UInt8 = Character("a").asciiValue!
  let upperA: UInt8 = Character("A").asciiValue!
  let chars =
    input.map {
      let ch =
        if $0.isLowercase {
          rotateChar(lowerA, $0.asciiValue!, shift)
        } else if $0.isUppercase {
          rotateChar(upperA, $0.asciiValue!, shift)
        } else {
          $0.asciiValue!
        }
      return Character(UnicodeScalar(ch))
    }
  return String(chars)
}
