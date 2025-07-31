class BinarySearchTree<T: Comparable> {
  var data: T
  var left: BinarySearchTree<T>?
  var right: BinarySearchTree<T>?

  init(_ initial: T) { data = initial }

  func insert(_ value: T) {
    if value <= data {
      if let left { left.insert(value) } else { left = BinarySearchTree(value) }
    } else {
      if let right { right.insert(value) } else { right = BinarySearchTree(value) }
    }
  }

  func allData() -> [T] { (left?.allData() ?? []) + [data] + (right?.allData() ?? []) }
}
