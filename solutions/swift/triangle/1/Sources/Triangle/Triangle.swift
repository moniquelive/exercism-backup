class Triangle {
  private(set) var isScalene = false
  private(set) var isIsosceles = false
  private(set) var isEquilateral = false

  init(_ v: [Double]) {
    let a = v[0]
    let b = v[1]
    let c = v[2]
    guard (a > 0 && b > 0 && c > 0) && (a + b > c && b + c > a && a + c > b) else { return }
    isScalene = (a != b && b != c && c != a)
    isIsosceles = (a == b || b == c || c == a)
    isEquilateral = (a == b && b == c && c == a)
  }
}
