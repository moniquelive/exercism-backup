func isPangram(_ text: String) -> Bool { Set(text.lowercased().filter(\.isLetter)).count == 26 }
