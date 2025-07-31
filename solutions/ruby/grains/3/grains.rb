module Grains
  extend self

  NUMBER_OF_SQUARES = 64
  TOTAL = (1 << NUMBER_OF_SQUARES) - 1

  def square(n)
    1 << (n-1)
  end

  def total
    TOTAL
  end

end