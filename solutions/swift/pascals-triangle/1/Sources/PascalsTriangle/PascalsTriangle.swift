func pascalsTriangle(rows: Int) -> [[Int]] {
  var triangle = [[Int]](repeating: [Int](repeating: 0, count: rows), count: rows)
  for row in 0..<rows {
    triangle[row] = [Int](repeating: 0, count: row + 1)
    for i in 0..<row + 1 {
      triangle[row][i] =
        row == i || i == 0
        ? 1
        : triangle[row - 1][i - 1] + triangle[row - 1][i]
    }
  }
  return triangle
}
