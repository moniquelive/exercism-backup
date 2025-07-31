typealias Wire = (String, String, String)
typealias Xform = (Wire) -> Wire

let flip: Xform = { ($0.1, $0.0, $0.2) }
let rotate: Xform = { ($0.1, $0.2, $0.0) }

func makeShuffle(flipper: @escaping Xform, rotator: @escaping Xform) -> (UInt8, Wire) -> Wire {
  return { id, tuple in
    (0..<id.bitWidth)
      .map { id & (1 << $0) == 0 }
      .reduce(tuple) { temp, bit in bit ? flipper(temp) : rotator(temp) }
  }
}
