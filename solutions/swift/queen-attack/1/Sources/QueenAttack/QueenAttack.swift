enum QueenError: Error { case inValidRow, inValidColumn }
class Queen {
  let column, row: Int
  init(row: Int, column: Int) throws {
    guard (0...7).contains(row) else { throw QueenError.inValidRow }
    guard (0...7).contains(column) else { throw QueenError.inValidColumn }
    (self.row, self.column) = (row, column)
  }
  func canAttack(other: Queen) -> Bool {
    return column == other.column || row == other.row
      || abs(row - other.row) == abs(column - other.column)
  }
}
