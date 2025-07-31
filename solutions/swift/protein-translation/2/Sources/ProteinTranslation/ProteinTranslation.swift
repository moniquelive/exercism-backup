enum TranslationError: Error { case invalidCodon }

func translationOfRNA(rna strand: String) throws -> [String] {
  var proteins = [String]()
  loop: for n in stride(from: 0, to: strand.count, by: 3) {
    switch strand.dropFirst(n).prefix(3) {
    case "AUG": proteins.append("Methionine")
    case "UUU", "UUC": proteins.append("Phenylalanine")
    case "UUA", "UUG": proteins.append("Leucine")
    case "UCU", "UCC", "UCA", "UCG": proteins.append("Serine")
    case "UAU", "UAC": proteins.append("Tyrosine")
    case "UGU", "UGC": proteins.append("Cysteine")
    case "UGG": proteins.append("Tryptophan")
    case "UAA", "UAG", "UGA": break loop
    default: throw TranslationError.invalidCodon
    }
  }
  return proteins
}
