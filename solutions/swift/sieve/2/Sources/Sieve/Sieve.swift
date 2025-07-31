import Foundation

class Cache {
  static var sieve: [Int] {
    var s = Array(0..<1003)
    s[1] = 0
    for p in s where p > 0 {
      for j in stride(from: p * p, to: s.count, by: p) {
        s[j] = 0
      }
    }
    s.removeAll { $0 == 0 }
    return s
  }
}

func sieve(limit: Int) -> [Int] { Cache.sieve.prefix { $0 <= limit } }
