class Element<T> {
  var value: T?
  var next: Element?
  init(_ value: T? = nil, _ next: Element? = nil) {
    self.value = value
    self.next = next
  }
  static func fromArray(_ array: [T]) -> Element {
    guard !array.isEmpty else { return Element() }
    let head = Element(array[0], nil)
    var p: Element? = head
    for el in array.dropFirst() {
      p!.next = Element(el, nil)
      p = p?.next
    }
    return head
  }
  func toArray() -> [T] {
    var result = [T]()
    var p: Element? = self
    while p != nil {
      if p?.value != nil { result.append(p!.value!) }
      p = p?.next
    }
    return result
  }
  func reverseElements() -> Element { Self.fromArray(self.toArray().reversed()) }
}
