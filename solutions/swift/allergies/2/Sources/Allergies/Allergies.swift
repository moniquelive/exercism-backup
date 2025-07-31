class Allergies {
  private let allergens = [
    "eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats",
  ]
  private let allergies: [String]

  init(_ score: Int) {
    allergies = allergens.enumerated().compactMap { score & (1 << $0) > 0 ? $1 : nil }
  }
  func allergicTo(item: String) -> Bool { allergies.contains(item) }
  func list() -> [String] { allergens.filter { allergicTo(item: $0) } }
}
