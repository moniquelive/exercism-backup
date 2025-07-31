func getCard(at index: Int, from stack: [Int]) -> Int {
  stack[index]
}

func setCard(at index: Int, in stack: [Int], to newCard: Int) -> [Int] {
  guard index >= 0 && index < stack.count else { return stack }
  return Array(stack[0..<index] + [newCard] + stack[index + 1..<stack.count])
}

func insert(_ newCard: Int, atTopOf stack: [Int]) -> [Int] {
  stack + [newCard]
}

func removeCard(at index: Int, from stack: [Int]) -> [Int] {
  guard index >= 0 && index < stack.count else { return stack }
  return Array(stack[0..<index] + stack[index + 1..<stack.count])
}

func removeTopCard(_ stack: [Int]) -> [Int] {
  guard stack.count > 0 else { return stack }
  return Array(stack[0..<stack.count - 1])
}

func insert(_ newCard: Int, atBottomOf stack: [Int]) -> [Int] {
  [newCard] + stack
}

func removeBottomCard(_ stack: [Int]) -> [Int] {
  guard stack.count > 0 else { return stack }
  return Array(stack[1..<stack.count])
}

func checkSizeOfStack(_ stack: [Int], _ size: Int) -> Bool {
  stack.count == size
}

func evenCardCount(_ stack: [Int]) -> Int {
  stack.count { $0.isMultiple(of: 2) }
}
