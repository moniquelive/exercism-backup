module Grains
  extend self

  NUMBER_OF_SQUARES = 64

  def square(n)
    1 << (n-1)
  end

  def total
    @result ||= (1..NUMBER_OF_SQUARES).map {|e| square(e) }.reduce(:+)
  end

end