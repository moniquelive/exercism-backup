func flattenArray(_ input: Any?) -> [Int] {
  switch input {
  case let optionalValue as Int?: if let value = optionalValue { return [value] } else { return [] }
  case let array as [Any?]: return array.flatMap(flattenArray)
  default: return []
  }
}
