enum SeriesError: Error { case emptySeries, sliceLengthZeroOrLess, sliceLengthLongerThanSeries }
class Series {
  let input: String
  init(_ input: String) { self.input = input }
  func combs(_ size: Int, _ lst: [Character]) -> [String] {
    lst.count < size ? [] : [String(lst[0..<size])] + combs(size, Array(lst.dropFirst()))
  }
  func slice(_ size: Int) throws -> [String] {
    guard !input.isEmpty else { throw SeriesError.emptySeries }
    guard size > 0 else { throw SeriesError.sliceLengthZeroOrLess }
    guard size <= input.count else { throw SeriesError.sliceLengthLongerThanSeries }
    return combs(size, Array(input))
  }
}
