class BinarySearchTree<T: Comparable> {
  var data: T
  var left: BinarySearchTree<T>?
  var right: BinarySearchTree<T>?

  init(_ initial: T) { data = initial }

  func insert(_ value: T) {
    if value <= data {
      left?.insert(value) ?? (left = BinarySearchTree(value))
    } else {
      right?.insert(value) ?? (right = BinarySearchTree(value))
    }
  }

  func allData() -> [T] { (left?.allData() ?? []) + [data] + (right?.allData() ?? []) }
}
