enum GrainsError: Error { case inputTooHigh, inputTooLow }

struct Grains {
  static func square(_ num: Int) throws -> UInt64 {
    guard num > 0 else { throw GrainsError.inputTooLow }
    guard num <= 64 else { throw GrainsError.inputTooHigh }

    return UInt64(1) << (num - 1)
  }

  static var total: UInt64 { ~UInt64(0) }
}
