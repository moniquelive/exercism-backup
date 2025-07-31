import Foundation

func sliceSize(diameter: Double?, slices: Int?) -> Double? {
  guard let diameter = diameter, diameter >= 0, let slices = slices, slices > 1 else { return nil }
  return pow(diameter / 2, 2) * Double.pi / Double(slices)
}

func biggestSlice(diameterA: String, slicesA: String, diameterB: String, slicesB: String) -> String
{
  let a = sliceSize(diameter: Double(diameterA), slices: Int(slicesA)) ?? -1
  let b = sliceSize(diameter: Double(diameterB), slices: Int(slicesB)) ?? -1
  if a > b { return "Slice A is bigger" }
  if b > a { return "Slice B is bigger" }
  return "Neither slice is bigger"
}
