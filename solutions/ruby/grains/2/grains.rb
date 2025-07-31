module Grains
  extend self

  NUMBER_OF_SQUARES = 64

  def square(n)
    1 << (n-1)
  end

  def total
    @total ||= (1 << NUMBER_OF_SQUARES) - 1
  end

end