let flip: ((String, String, String)) -> (String, String, String) = { ($0.1, $0.0, $0.2) }
let rotate: ((String, String, String)) -> (String, String, String) = { ($0.1, $0.2, $0.0) }

func makeShuffle(
  flipper: @escaping ((String, String, String)) -> (String, String, String),
  rotator: @escaping ((String, String, String)) -> (String, String, String)
) -> (UInt8, (String, String, String)) -> (String, String, String) {
  return {
    var n = $0
    var t = $1
    for _ in 0..<8 {
      if n & 1 == 0 { t = flipper(t) } else { t = rotator(t) }
      n >>= 1
    }
    return t
  }
}
