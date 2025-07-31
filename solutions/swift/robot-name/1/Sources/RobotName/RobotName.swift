class Robot {
  private(set) var name = ""
  init() { resetName() }
  static var l: String { String("ABCDEFGHIJKLMNOPQRSTUVWXYZ".randomElement()!) }
  func resetName() { name = "\(Self.l)\(Self.l)\(Int.random(in: 100...999))" }
}
