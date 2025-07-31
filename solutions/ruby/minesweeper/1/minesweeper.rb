# frozen_string_literal: true

module Board
  def self.transform(board)
    raise ArgumentError unless validate?(board)
    board.length.times do |row|
      board[row].length.times do |col|
        board[row][col] = count_neighbors(board, row, col) if board[row][col] == ' '
      end
    end
    board
  end

  def self.validate?(b)
    b.map(&:length).uniq.size == 1 && \
      b.map { "+|".include? _1[0] }.all? && \
      b.map { "+|".include? _1[-1] }.all? && \
      b[1..-2].map { |row| row[1..-2].chars.map { " *".include? _1 }.all? }.all?
  end

  def self.count_neighbors(b, row, col)
    bombs = 0
    (row-1..row+1).each do |r|
      (col-1..col+1).each do |c|
        bombs += b[r][c] == '*' ? 1 : 0 unless c == col && r == row
      end
    end
    return ' ' if bombs.zero?
    bombs.to_s
  end
end
