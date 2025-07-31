import Foundation

private func isShouting(_ message: String) -> Bool {
  message.contains(where: \Character.isUppercase)
    && !message.contains(where: \Character.isLowercase)
}

class Bob {
  static func response(_ message: String) -> String {
    let message = message.trimmingCharacters(in: .whitespacesAndNewlines)
    if message.isEmpty {
      return "Fine. Be that way!"
    } else if message.last == "?" {
      return isShouting(message) ? "Calm down, I know what I'm doing!" : "Sure."
    } else {
      return isShouting(message) ? "Whoa, chill out!" : "Whatever."
    }
  }
}
