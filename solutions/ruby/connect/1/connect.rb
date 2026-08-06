# frozen_string_literal: true

# class Board
class Board
  def initialize(rows) = (@rows = rows.map { _1.delete(' ') }
                          @height = @rows.size
                          @width = @rows.first&.size.to_i)

  def winner
    return 'X' if connected?('X', @height.times.map { [_1, 0] }) { _2 == @width - 1 }
    return 'O' if connected?('O', @width.times.map { [0, _1] }) { _1 == @height - 1 }

    ''
  end

  private

  NEIGHBORS = [[-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0]].freeze
  def connected?(stone, starts)
    stack = starts.select { |r, c| @rows[r]&.[](c) == stone }
    seen = stack.to_h { [_1, true] }

    until stack.empty?
      r, c = stack.pop
      return true if yield(r, c)

      NEIGHBORS.each do |dr, dc|
        nr = r + dr
        nc = c + dc
        next unless nr.between?(0, @height - 1) && nc.between?(0, @width - 1)
        next unless @rows[nr][nc] == stone

        pos = [nr, nc]
        next if seen[pos]

        seen[pos] = true
        stack << pos
      end
    end

    false
  end
end
