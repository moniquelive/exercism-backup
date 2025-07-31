func dartScore(x: Double, y: Double) -> Int {
  return switch (x * x + y * y).squareRoot() {
  case ...1: 10
  case ...5: 5
  case ...10: 1
  default: 0
  }
}
