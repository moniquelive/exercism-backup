# frozen_string_literal: true

# Pal
Pal = Struct.new(:value, :factors)

# class Palindromes
class Palindromes
  attr_reader :smallest, :largest, :max, :min

  def initialize(max_factor: 0, min_factor: 0)
    @max = max_factor
    @min = min_factor
  end

  def generate
    raise ArgumentError, 'min must be <= max' unless min <= max

    @smallest = @largest = Pal.new(nil, [])

    (min * min).upto(max * max).each do |num|
      next unless pal?(num)

      f = factors(num)
      @smallest = Pal.new(num, f) and break if f.any?
    end
    (max * max).downto(min * min).each do |num|
      next unless pal?(num)

      f = factors(num)
      @largest = Pal.new(num, f) and break if f.any?
    end
  end

  private

  def factors(num)
    (min..Integer.sqrt(num).floor).filter_map do |i|
      if i.positive? && (num % i).zero?
        j = (num / i).floor
        [i, j] if (min..max).cover?(j)
      end
    end
  end

  def pal?(num)
    s = num.to_s
    s == s.reverse
  end
end
