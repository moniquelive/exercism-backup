func commands(number: Int) -> [String] {
  var result = [String]()
  if number & 1 == 1 { result.append("wink") }
  if number & 2 == 2 { result.append("double blink") }
  if number & 4 == 4 { result.append("close your eyes") }
  if number & 8 == 8 { result.append("jump") }
  return number & 16 == 16 ? result.reversed() : result
}
