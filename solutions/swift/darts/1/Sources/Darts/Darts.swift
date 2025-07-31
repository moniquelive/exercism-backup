func dartScore(x: Double, y: Double) -> Int {
  let dist = (x * x + y * y).squareRoot()

  switch dist {
  case _ where dist > 10: return 0
  case ...1: return 10
  case ...5: return 5
  default: return 1
  }
}
