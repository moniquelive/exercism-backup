class ETL {
  static func transform(_ old: [String: [String]]) -> [String: Int] {
    old.reduce(into: [String: Int]()) { (result, pair) in
      (pair.1).forEach { result[$0.lowercased()] = Int(pair.0) }
    }
  }
}
