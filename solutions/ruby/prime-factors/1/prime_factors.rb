# PrimeFactors
module PrimeFactors
  module_function

  def for(n)
    [].tap do |factors|
      factor = 2
      while n > 1
        while (n % factor).zero?
          factors << factor
          n /= factor
        end
        factor += 1
      end
    end
  end
end