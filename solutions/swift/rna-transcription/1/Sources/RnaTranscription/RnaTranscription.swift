func toRna(_ dna: String) -> String {
  let m: [Character: Character] = ["G": "C", "C": "G", "T": "A", "A": "U"]
  return String(dna.map { m[$0, default: $0] })
}
