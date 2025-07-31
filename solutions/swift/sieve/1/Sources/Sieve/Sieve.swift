import Foundation

func sieve(limit: Int) -> [Int] {
  var sieve = Array(0..<1003)
  sieve[1] = 0
  for p in sieve where p > 0 {
    for j in stride(from: p * p, to: sieve.count, by: p) {
      sieve[j] = 0
    }
  }
  return sieve.filter { $0 > 0 }.prefix { $0 <= limit }
}
