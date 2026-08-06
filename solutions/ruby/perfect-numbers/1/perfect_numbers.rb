module PerfectNumber
  def self.classify(number)
    raise ArgumentError, 'Classification is only possible for positive integers.' unless number.positive?

    a = (1..number / 2).filter { (number % _1).zero? }.sum
    if a < number then 'deficient'
    elsif a > number then 'abundant'
    else 'perfect'
    end
  end
end
