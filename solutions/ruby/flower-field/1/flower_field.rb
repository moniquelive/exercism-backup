# frozen_string_literal: true

# module FlowerField
module FlowerField
  OFFSETS = [-1, 0, 1].product([-1, 0, 1]).reject { |dx, dy| dx.zero? && dy.zero? }

  def self.annotate(garden)
    garden.map.with_index do |row, y|
      row.chars.map.with_index do |cell, x|
        next '*' if cell == '*'

        flowers = OFFSETS.count do |dx, dy|
          neighbor_y = y + dy
          neighbor_x = x + dx
          garden[neighbor_y][neighbor_x] == '*' if neighbor_y.between?(0, garden.length - 1)
                                                && neighbor_x.between?(0, garden[neighbor_y].length - 1)
        end
        flowers.zero? ? ' ' : flowers.to_s
      end.join
    end
  end
end
