class ETL {
  static func transform(_ old: [String: [String]]) -> [String: Int] {
    Dictionary(
      uniqueKeysWithValues: old.flatMap { (key, values) in
        values.map { ($0.lowercased(), Int(key) ?? 0) }
      }
    )
  }
}
