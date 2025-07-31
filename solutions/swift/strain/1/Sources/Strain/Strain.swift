extension Array {
  func discard(predicate: (Element) -> Bool) -> [Element] {
    keep { !predicate($0) }
  }

  func keep(predicate: (Element) -> Bool) -> [Element] {
    var retval = [Element]()
    for item in self where predicate(item) {
      retval.append(item)
    }
    return retval
  }
}
