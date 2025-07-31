func commands(number: Int) -> [String] {
  var result = [String]()
  if number & 0b00001 > 0 { result.append("wink") }
  if number & 0b00010 > 0 { result.append("double blink") }
  if number & 0b00100 > 0 { result.append("close your eyes") }
  if number & 0b01000 > 0 { result.append("jump") }
  if number & 0b10000 > 0 { result.reverse() }
  return result
}
