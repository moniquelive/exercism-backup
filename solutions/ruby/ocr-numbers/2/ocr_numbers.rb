# frozen_string_literal: true

# ...
class Numeric
  def divisible_by?(div)
    (self % div).zero?
  end
end

# ...
module OcrNumbers
  @digits = {    ' _ | ||_|   ' => '0',
                 '     |  |   ' => '1',
                 ' _  _||_    ' => '2',
                 ' _  _| _|   ' => '3',
                 '   |_|  |   ' => '4',
                 ' _ |_  _|   ' => '5',
                 ' _ |_ |_|   ' => '6',
                 ' _   |  |   ' => '7',
                 ' _ |_||_|   ' => '8',
                 ' _ |_| _|   ' => '9' }
  @digits.default = '?'

  def self.convert(str)
    split = str.lines(chomp: true)
    raise ArgumentError unless split.length.divisible_by?(4) &&
                               split.first.length.divisible_by?(3)

    split.each_slice(4).map do |lines|
      lines.map { |line| line.scan(/.../) }
           .transpose
           .map { |d| @digits[d.join] }.join
    end.join(',')
  end
end
