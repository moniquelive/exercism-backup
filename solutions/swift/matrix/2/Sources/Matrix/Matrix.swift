struct Matrix {
  let rows: [[Int]]
  var columns: [[Int]] {
    rows[0].indices.map { c in
      rows.indices.map { r in rows[r][c] }
    }
  }

  init(_ line: String) {
    rows = line.split(separator: "\n")
      .map { $0.split(separator: " ").compactMap { Int($0) } }
  }
}
