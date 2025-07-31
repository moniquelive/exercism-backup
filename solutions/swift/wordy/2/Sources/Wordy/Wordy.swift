enum WordyError: Error {
  case syntaxError
}

func wordyAnswer(_ question: String) throws -> Int {
  guard question.hasPrefix("What is ") else { throw WordyError.syntaxError }
  guard question.hasSuffix("?") else { throw WordyError.syntaxError }
  let answer = question.dropFirst("What is ".count).dropLast()
  var split = answer.split(separator: " ")
  var result = Int(split[0]) ?? 0
  split = Array(split.dropFirst())
  while split.count > 0 {
    switch split[0] {
    case "plus":
      result += Int(split[1]) ?? 0
    case "minus":
      result -= Int(split[1]) ?? 0
    case "multiplied":
      split = Array(split.dropFirst())
      result *= Int(split[1]) ?? 0
    case "divided":
      split = Array(split.dropFirst())
      result /= Int(split[1]) ?? 0
    default:
      throw WordyError.syntaxError
    }
    split = Array(split.dropFirst(2))
  }
  return result
}
