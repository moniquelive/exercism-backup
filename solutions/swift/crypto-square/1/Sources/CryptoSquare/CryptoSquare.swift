import Foundation

extension Array {
  func chunked(into size: Int) -> [[Element]] {
    stride(from: 0, to: count, by: size).map {
      Array(self[$0..<Swift.min($0 + size, count)])
    }
  }
}

func transpose(_ m: [[Character]]) -> [[Character]] {
  guard let firstRow = m.first else { return [] }
  return firstRow.indices.map { index in
    m.map { index < $0.count ? $0[index] : " " }
  }
}

func cryptoSquare(text: String) -> String {
  let sanitized = Array(text.filter { $0.isWholeNumber || $0.isLetter }.lowercased())
  guard !sanitized.isEmpty else { return "" }
  let s = Double(sanitized.count).squareRoot()
  let (c, r) = (Int(ceil(s)), Int(round(s)))
  return
    transpose(
      sanitized.chunked(into: c)
    ).map { String($0).padding(toLength: r, withPad: " ", startingAt: 0) }
    .joined(separator: " ")
}
