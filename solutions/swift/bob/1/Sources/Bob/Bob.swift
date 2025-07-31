import Foundation

private func isQuestion(_ message: String) -> Bool { message.hasSuffix("?") }
private func isShouting(_ message: String) -> Bool {
  message.contains(where: \Character.isUppercase)
    && !message.contains(where: \Character.isLowercase)
}

class Bob {
  static func response(_ message: String) -> String {
    let message = message.trimmingCharacters(in: .whitespacesAndNewlines)
    if message.isEmpty { return "Fine. Be that way!" }
    if isQuestion(message) && isShouting(message) { return "Calm down, I know what I'm doing!" }
    if isQuestion(message) { return "Sure." }
    if isShouting(message) { return "Whoa, chill out!" }
    return "Whatever."
  }
}
