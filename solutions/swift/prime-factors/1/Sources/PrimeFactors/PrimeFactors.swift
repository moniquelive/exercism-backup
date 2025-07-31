func primeFactors(_ number: Int64) -> [Int64] {
  var result = [Int64]()
  var n = number
  while n.isMultiple(of: 2) {
    result.append(2)
    n /= 2
  }
  var d = Int64(3)
  while d * d <= n {
    while n.isMultiple(of: d) {
      result.append(d)
      n /= d
    }
    d += 2
  }
  if n > 2 { result.append(n) }
  return result
}
