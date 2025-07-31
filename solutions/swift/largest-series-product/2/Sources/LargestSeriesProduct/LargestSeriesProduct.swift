enum NumberSeriesError: Error { case invalidCharacter, spanIsZeroOrNegative, spanLongerThanInput }
class NumberSeries {
  let digits: [Int]
  init(_ digits: String) throws {
    guard digits.allSatisfy(\.isNumber) else { throw NumberSeriesError.invalidCharacter }
    self.digits = digits.compactMap(\.wholeNumberValue)
  }
  func largestProduct(_ span: Int) throws -> Int {
    guard span > 0 else { throw NumberSeriesError.spanIsZeroOrNegative }
    guard span <= digits.count else { throw NumberSeriesError.spanLongerThanInput }
    return (0...digits.count - span).map { digits[$0..<$0 + span].reduce(1, *) }.max()!
  }
}
