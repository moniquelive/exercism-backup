# frozen_string_literal: true

# ...
module OcrNumbers
  @digits = [
    " _ \n| |\n|_|\n   ",
    "   \n  |\n  |\n   ",
    " _ \n _|\n|_ \n   ",
    " _ \n _|\n _|\n   ",
    "   \n|_|\n  |\n   ",
    " _ \n|_ \n _|\n   ",
    " _ \n|_ \n|_|\n   ",
    " _ \n  |\n  |\n   ",
    " _ \n|_|\n|_|\n   ",
    " _ \n|_|\n _|\n   "
  ]

  def self.nth_digit(digits, nth)
    digits[(nth * 3)...(nth * 3 + 3)]
  end

  def self.translate_digit(lines, nth)
    lines.map { |d| nth_digit(d, nth) }.join("\n")
  end

  def self.convert(str)
    split = str.split("\n")
    raise ArgumentError if split.length % 4 != 0
    raise ArgumentError if split.first.length % 3 != 0

    split.each_slice(4).map do |lines|
      n_digits = lines.first.length / 3
      n_digits.times
              .map { |n| translate_digit(lines, n) }
              .map { |d| (@digits.index(d) || '?').to_s }.join
    end.join(',')
  end
end
