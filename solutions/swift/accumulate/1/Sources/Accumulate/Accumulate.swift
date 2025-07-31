//Solution goes in Sources
extension Array {
    func accumulate<T>(_ combine: (Element) -> T) -> [T] {
        var result = [T]()
        for element in self { result.append(combine(element)) }
        return result
    }
}
