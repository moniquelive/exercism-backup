module PerfectNumber
  def self.classify(number)
    raise ArgumentError, 'Classification is only possible for positive integers.' unless number.positive?

    a = (2..Integer.sqrt(number)).inject(0) do |sum, n|
      q, m = number.divmod(n)
      if m.zero? then sum + n + (n != q ? q : 0)
      else sum
      end
    end
    a += (number == 1 ? 0 : 1)
    if a < number then 'deficient'
    elsif a > number then 'abundant'
    else 'perfect'
    end
  end
end
