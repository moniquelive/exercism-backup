func raindrops(_ number: Int) -> String {
  var ret = ""
  if number.isMultiple(of: 3) { ret += "Pling" }
  if number.isMultiple(of: 5) { ret += "Plang" }
  if number.isMultiple(of: 7) { ret += "Plong" }
  return ret.isEmpty ? String(number) : ret
}
