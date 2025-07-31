func tripletsWithSum(_ sum: Int) -> [[Int]] {
  var result: [[Int]] = []
  for a in 3..<sum / 3 {
    let b_plus_c = sum - a
    let b = (b_plus_c * b_plus_c - a * a) / (2 * b_plus_c)
    let c = sum - a - b
    if a < b && a * a + b * b == c * c { result.append([a, b, c]) }
  }
  return result
}
