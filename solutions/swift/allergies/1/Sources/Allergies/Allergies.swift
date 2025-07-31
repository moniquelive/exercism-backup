struct Allergen: OptionSet {
  let rawValue: Int
  static let eggs = Allergen(rawValue: 1)
  static let peanuts = Allergen(rawValue: 2)
  static let shellfish = Allergen(rawValue: 4)
  static let strawberries = Allergen(rawValue: 8)
  static let tomatoes = Allergen(rawValue: 16)
  static let chocolate = Allergen(rawValue: 32)
  static let pollen = Allergen(rawValue: 64)
  static let cats = Allergen(rawValue: 128)
}

class Allergies {
  let allergen: Allergen
  init(_ score: Int) {
    self.allergen = Allergen(rawValue: score)
  }
  func allergicTo(item: String) -> Bool {
    switch item {
    case "eggs": return allergen.contains(.eggs)
    case "peanuts": return allergen.contains(.peanuts)
    case "shellfish": return allergen.contains(.shellfish)
    case "strawberries": return allergen.contains(.strawberries)
    case "tomatoes": return allergen.contains(.tomatoes)
    case "chocolate": return allergen.contains(.chocolate)
    case "pollen": return allergen.contains(.pollen)
    case "cats": return allergen.contains(.cats)
    default: fatalError()
    }
  }
  func list() -> [String] {
    var retval = [String]()
    if allergen.contains(.eggs) { retval.append("eggs") }
    if allergen.contains(.peanuts) { retval.append("peanuts") }
    if allergen.contains(.shellfish) { retval.append("shellfish") }
    if allergen.contains(.strawberries) { retval.append("strawberries") }
    if allergen.contains(.tomatoes) { retval.append("tomatoes") }
    if allergen.contains(.chocolate) { retval.append("chocolate") }
    if allergen.contains(.pollen) { retval.append("pollen") }
    if allergen.contains(.cats) { retval.append("cats") }
    return retval
  }
}
