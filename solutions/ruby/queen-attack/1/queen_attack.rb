# frozen_string_literal: true

# class Queens
class Queens
  def initialize(white:, black: nil) = (raise ArgumentError unless white.all? { (0..7).cover?(_1) }

                                        @white = white
                                        @black = black)

  def attack? = (raise ArgumentError unless @black

                 @white.first == @black.first || @white.last == @black.last ||
                   (@white.first - @black.first).abs == (@white.last - @black.last).abs)
end
