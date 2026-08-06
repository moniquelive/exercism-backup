# frozen_string_literal: true

# class Queens
class Queens
  BOARD = 0..7
  def initialize(white:, black: [0, 0]) = ((@wx, @wy, @bx, @by) = [*white, *black]
                                           raise ArgumentError unless BOARD.cover?(@wx) && BOARD.cover?(@wy))

  def attack? = @wx == @bx || @wy == @by || (@wx - @bx).abs == (@wy - @by).abs
end
