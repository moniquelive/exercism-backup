func sliceSize(diameter: Double?, slices: Int?) -> Double? {
  guard let diameter = diameter, diameter >= 0 else { return nil }
  guard let slices = slices, slices > 1 else { return nil }
  let r = diameter / 2
  let area = Double.pi * r * r
  return area / Double(slices)
}

func biggestSlice(
  diameterA: String, slicesA: String,
  diameterB: String, slicesB: String
) -> String {
  let sA = sliceSize(diameter: Double.init(diameterA), slices: Int.init(slicesA))
  let sB = sliceSize(diameter: Double.init(diameterB), slices: Int.init(slicesB))
  switch (sA, sB) {
  case (.none, .none): return "Neither slice is bigger"
  case (.some(_), .none): return "Slice A is bigger"
  case (.none, .some(_)): return "Slice B is bigger"
  case (.some(let a), .some(let b)):
    return (a > b ? "Slice A is bigger" : a < b ? "Slice B is bigger" : "Neither slice is bigger")
  }
}
