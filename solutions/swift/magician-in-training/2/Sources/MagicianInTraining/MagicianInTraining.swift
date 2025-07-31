func getCard(at index: Int, from stack: [Int]) -> Int { stack[index] }

func setCard(at index: Int, in stack: [Int], to newCard: Int) -> [Int] {
  var dup = stack
  if index >= 0 && index < stack.count { dup[index] = newCard }
  return dup
}

func insert(_ newCard: Int, atTopOf stack: [Int]) -> [Int] { stack + [newCard] }

func removeCard(at index: Int, from stack: [Int]) -> [Int] {
  var dup = stack
  if index >= 0 && index < stack.count { dup.remove(at: index) }
  return dup
}

func removeTopCard(_ stack: [Int]) -> [Int] { stack.dropLast() }
func insert(_ newCard: Int, atBottomOf stack: [Int]) -> [Int] { [newCard] + stack }
func removeBottomCard(_ stack: [Int]) -> [Int] { Array(stack.dropFirst()) }
func checkSizeOfStack(_ stack: [Int], _ size: Int) -> Bool { stack.count == size }
func evenCardCount(_ stack: [Int]) -> Int { stack.filter { $0.isMultiple(of: 2) }.count }
