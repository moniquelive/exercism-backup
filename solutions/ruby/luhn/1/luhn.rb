# frozen_string_literal: true

# Luhn class
class Luhn
  def self.valid?(str)
    digits = str.gsub(/\d/).to_a.map(&:to_i)
    return false if digits.size <= 1
    return false if str.gsub(/[^\d\s]/).to_a.size.positive?

    every1 = digits.select.with_index { _2.even? != digits.length.even? }
    every2 = digits.select.with_index { _2.even? == digits.length.even? }
    doubles = every2.lazy.map { _1 * 2 }.map { _1 > 9 ? _1 - 9 : _1 }

    ((doubles.sum + every1.sum) % 10).zero?
  end
end
