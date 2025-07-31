func append<T>(_ a : [T], _ b : [T]) -> [T] {
    a.isEmpty ? b : [a[0]] + append(Array(a.dropFirst()), b)
}

func concat<T>(_ a : [T]...) -> [T] {
    foldLeft(a, accumulated: [], combine: append)
}

func filter<T>(_ a : [T], _ f : (T) -> Bool) -> [T] {
    if a.isEmpty {
        return []
    } else {
        return f(a[0]) ? [a[0]] + filter(Array(a.dropFirst()), f) : filter(Array(a.dropFirst()), f)
    }
}

func length<T>(_ a : [T]) -> Int {
    a.isEmpty ? 0 : 1 + length(Array(a.dropFirst()))
}

func reverse<T>(_ a : [T]) -> [T] {
    return a.isEmpty ? [] : reverse(Array(a.dropFirst())) + [a[0]]
}

func map<T,U>(_ a : [T], _ f : (T) -> U) -> [U] {
    a.isEmpty ? [] : [f(a[0])] + map(Array(a.dropFirst()), f)
}

func foldLeft<T>(_ a : [T], accumulated : T, combine : (T, T) -> T) -> T {
    a.isEmpty ? accumulated : foldLeft(Array(a.dropFirst()), accumulated: combine(accumulated, a[0]), combine: combine)
}

func foldRight<T>(_ a : [T], accumulated : T, combine : (T, T) -> T) -> T {
    return a.isEmpty ? accumulated : foldRight(Array(a.dropLast()), accumulated: combine(a.last!, accumulated), combine: combine)
}
