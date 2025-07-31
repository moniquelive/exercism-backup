enum WordyError: Error { case syntaxError }

func wordyAnswer(_ question: String) throws -> Int {
  guard question.hasPrefix("What is "),
    question.hasSuffix("?")
  else { throw WordyError.syntaxError }
  let split = question.dropFirst("What is ".count).dropLast().split(separator: " ")

  var i = 0
  guard var result = Int(split[i]) else { throw WordyError.syntaxError }
  i += 1
  while i < split.count {
    switch split[i] {
    case "plus":
      guard i < split.count - 1, let v = Int(split[i + 1]) else { throw WordyError.syntaxError }
      result += v
    case "minus":
      guard i < split.count - 1, let v = Int(split[i + 1]) else { throw WordyError.syntaxError }
      result -= v
    case "multiplied" where split[i + 1] == "by":
      i += 1
      guard i < split.count - 1, let v = Int(split[i + 1]) else { throw WordyError.syntaxError }
      result *= v
    case "divided" where split[i + 1] == "by":
      i += 1
      guard i < split.count - 1, let v = Int(split[i + 1]) else { throw WordyError.syntaxError }
      result /= v
    default: throw WordyError.syntaxError
    }
    i += 2
  }
  return result
}
