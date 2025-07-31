import Foundation

func isArmstrongNumber(_ number: Int) -> Bool {
    let nDigits: Double = floor(1 + log10(Double(number)))
    var sum = 0
    var i = number
    while i > 0 && sum <= number {
        sum += Int(pow(Double(i % 10), nDigits))
        i /= 10
    }
    return sum == number
}
