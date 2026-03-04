# frozen_string_literal: true

# class Darts
class Darts
  attr_reader :score

  def initialize(coord_x, coord_y)
    dist = Math.sqrt(coord_x * coord_x + coord_y * coord_y)
    @score = if dist <= 1 then 10
             elsif dist <= 5 then 5
             elsif dist <= 10 then 1
             else 0
             end
  end
end
