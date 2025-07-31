func dartScore(x: Double, y: Double) -> Int {
  switch (x * x + y * y).squareRoot() {
  case ...1: return 10
  case ...5: return 5
  case ...10: return 1
  default: return 0
  }
}
