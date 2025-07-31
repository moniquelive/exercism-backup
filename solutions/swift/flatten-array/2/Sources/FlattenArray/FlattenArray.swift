func flattenArray(_ input: [Any?]) -> [Int] {
  input.flatMap {
    ($0 as? Int).map { [$0] }
      ?? flattenArray($0 as? [Any?] ?? [])
  }
}
