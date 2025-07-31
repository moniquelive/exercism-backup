import Foundation

private func isShouting(_ message: String) -> Bool {
  message.contains(where: \Character.isUppercase)
    && !message.contains(where: \Character.isLowercase)
}

class Bob {
  static func response(_ message: String) -> String {
    let message = message.trimmingCharacters(in: .whitespacesAndNewlines)
    return if message.isEmpty {
      "Fine. Be that way!"
    } else if message.last == "?" {
      isShouting(message) ? "Calm down, I know what I'm doing!" : "Sure."
    } else {
      isShouting(message) ? "Whoa, chill out!" : "Whatever."
    }
  }
}
