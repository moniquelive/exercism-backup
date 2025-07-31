struct Acronym {
  static func abbreviate(_ inString: String) -> String {
    inString
      .split(separator: /[ _-]/)
      .map { $0.first!.uppercased() }
      .joined(separator: "")
  }
}
