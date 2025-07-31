extension Array {
  func windowed(into size: Int) -> [[Element]] {
    stride(from: 0, through: count - size, by: 1).map { Array(self[$0..<$0 + size]) }
  }
}

enum NumberSeriesError: Error { case invalidCharacter, spanIsZeroOrNegative, spanLongerThanInput }
class NumberSeries {
  let digits: [Int]?
  init(_ digits: String) {
    self.digits =
      digits.allSatisfy { $0 >= "0" && $0 <= "9" }
      ? digits.map { $0.wholeNumberValue! } : nil
  }
  func largestProduct(_ span: Int) throws -> Int {
    guard let digits else { throw NumberSeriesError.invalidCharacter }
    guard span >= 0 else { throw NumberSeriesError.spanIsZeroOrNegative }
    guard span <= digits.count else { throw NumberSeriesError.spanLongerThanInput }

    return
      digits.windowed(into: span)
      .reduce(0) { max, win in Swift.max(max, win.reduce(1, *)) }
  }
}
