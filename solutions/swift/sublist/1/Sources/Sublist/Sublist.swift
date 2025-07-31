enum Relation { case equal, sublist, superlist, unequal }

func contains(_ listOne: [Int], _ listTwo: [Int]) -> Bool {
  guard listOne.count > 0 else { return false }
  return listOne.starts(with: listTwo) || contains(Array(listOne.dropFirst()), listTwo)
}

func classifier(listOne: [Int], listTwo: [Int]) -> Relation {
  if listOne == listTwo { return .equal }
  if contains(listOne, listTwo) { return .superlist }
  if contains(listTwo, listOne) { return .sublist }
  return .unequal
}
