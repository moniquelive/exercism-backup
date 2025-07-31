func isIsogram(_ string: String) -> Bool {
  let string = string.lowercased().filter(\.isLetter)
  return string.count == Set(string).count
}
