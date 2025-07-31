#
class SumOfMultiples
  #
  def initialize(*divisors)
    @divisors = divisors
  end

  def to(x)
    (1...x).select { |n| @divisors.any? { |d| (n % d).zero? } }.reduce(:+) || 0
  end
end