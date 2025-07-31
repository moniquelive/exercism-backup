struct CustomSet: Equatable {
  var val: [Int]
  var isEmpty: Bool { val.isEmpty }
  init(_ val: [Int]) { self.val = val }

  func union(_ other: CustomSet) -> CustomSet {
    val.reduce(into: CustomSet(other.val)) { $0.add($1) }
  }
  func difference(_ other: CustomSet) -> CustomSet {
    CustomSet(val.filter { !other.val.contains($0) })
  }
  func intersection(_ other: CustomSet) -> CustomSet {
    CustomSet(val.filter { other.val.contains($0) })
  }
  mutating func add(_ el: Int) {
    guard !val.contains(el) else { return }
    self.val.append(el)
  }
  func isDisjoint(with other: CustomSet) -> Bool { val.allSatisfy { !other.val.contains($0) } }
  func isSubset(of other: CustomSet) -> Bool { val.allSatisfy { other.val.contains($0) } }
  func contains(_ el: Int) -> Bool { val.contains(el) }
  static func == (lhs: CustomSet, rhs: CustomSet) -> Bool { lhs.val.sorted() == rhs.val.sorted() }
}
