enum BinarySearchError: Error { case valueNotFound }

class BinarySearch {
  private let set: [Int]
  init(_ set: [Int]) { self.set = set }

  func searchFor(_ value: Int) throws -> Int {
    try bin(value, 0, set.count - 1)
  }

  private func bin(_ key: Int, _ from: Int, _ to: Int) throws -> Int {
    guard from <= to else { throw BinarySearchError.valueNotFound }

    let avg = (from + to) / 2
    let value = set[avg]

    if key < value { return try bin(key, from, avg - 1) }
    if key > value { return try bin(key, avg + 1, to) }
    return avg
  }
}
