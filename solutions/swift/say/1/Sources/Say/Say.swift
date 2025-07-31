import Foundation

let units = [
    "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven",
    "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen",
]
let tens = ["", "", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
let above = ["", "", " hundred", " thousand", "", "", " million", "", "", " billion"]
func go(_ number: Int, _ base: Int) -> String {
    let (div, mod) = (number / base, number % base)
    let begin = number < 100 ? tens[div] : speak(div)
    let end = speak(mod)
    let prefixLabel = above[Int(round(log10(Double(base))))]
    return begin + prefixLabel
        + (end == "zero" ? "" : (number < 100 ? "-" : " ") + end)
}
func speak(_ number: Int) -> String {
    switch number {
    case 0..<20: units[number]
    case 20..<100: go(number, 10)
    case 100..<1000: go(number, 100)
    case 1000..<1_000_000: go(number, 1000)
    case 1_000_000..<1_000_000_000: go(number, 1_000_000)
    case 1_000_000_000..<1_000_000_000_000: go(number, 1_000_000_000)
    default: "not a number"
    }
}
enum SayError: Error { case outOfRange }
func say(number: Int) throws -> String {
    guard number >= 0, number < 999_999_999_999 else { throw SayError.outOfRange }
    return speak(number)
}
