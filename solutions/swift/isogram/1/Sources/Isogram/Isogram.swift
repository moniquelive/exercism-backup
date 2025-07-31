func isIsogram(_ string: String) -> Bool {
  var set = Array(repeating: false, count: 32)
  for c in string {
    guard c.isLetter else { continue }
    let index = Int(c.lowercased().unicodeScalars.first!.value - 97)
    guard !set[index] else { return false }
    set[index] = true
  }
  return true
}
