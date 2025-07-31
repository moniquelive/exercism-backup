struct Matrix {
  let rows: [[Int]]
  private(set) var columns = [[Int]]()

  init(_ line: String) {
    rows =
      line
      .split(separator: "\n")
      .map { $0.split(separator: " ").compactMap { Int($0) } }
    for i in 0..<rows[0].count {
      columns.append([Int](repeating: 0, count: rows.count))
      for j in 0..<rows.count {
        columns[i][j] = rows[j][i]
      }
    }
  }
}
