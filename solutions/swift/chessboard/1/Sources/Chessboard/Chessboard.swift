let ranks = 1...8
let files = "A"..."H"

func isVaildSquare(rank: Int, file: String) -> Bool {
  ranks.contains(rank) && files.contains(file)
}

func getRow(_ board: [String], rank: Int) -> [String] {
  let rank = String(rank)
  return board.filter { $0.hasPrefix(rank) }
}
