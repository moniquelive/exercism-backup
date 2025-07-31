func raindrops(_ number: Int) -> String {
  let ret =
    (number.isMultiple(of: 3) ? "Pling" : "")
    + (number.isMultiple(of: 5) ? "Plang" : "")
    + (number.isMultiple(of: 7) ? "Plong" : "")
  return ret.isEmpty ? String(number) : ret
}
