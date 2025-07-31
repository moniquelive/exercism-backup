enum Relation { case equal, sublist, superlist, unequal }

func classifier(listOne: [Int], listTwo: [Int]) -> Relation {
  listOne == listTwo
    ? .equal
    : listOne.contains(listTwo)
      ? .superlist
      : listTwo.contains(listOne)
        ? .sublist : .unequal
}
