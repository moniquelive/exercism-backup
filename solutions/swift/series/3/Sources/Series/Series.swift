enum SeriesError: Error { case emptySeries, sliceLengthZeroOrLess, sliceLengthLongerThanSeries }
class Series {
  let input: String
  init(_ input: String) { self.input = input }
  func slice(_ size: Int) throws -> [String] {
    guard !input.isEmpty else { throw SeriesError.emptySeries }
    guard size > 0 else { throw SeriesError.sliceLengthZeroOrLess }
    guard size <= input.count else { throw SeriesError.sliceLengthLongerThanSeries }
    return (0...input.count - size).map { String(Array(input)[$0..<$0 + size]) }
  }
}
