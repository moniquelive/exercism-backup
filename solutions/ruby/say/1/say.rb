# frozen_string_literal: true

# class Say
class Say
  SMALL = %w[ zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen
              sixteen seventeen eighteen nineteen].freeze
  TENS = [nil, nil, 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'].freeze
  SCALES = { 1e9 => 'billion', 1e6 => 'million', 1e3 => 'thousand' }.freeze

  def initialize(number)
    raise ArgumentError unless (0...1e12).cover?(number)

    @number = number
  end

  def in_english(number = @number)
    tens, ones = number.divmod(10)
    hundreds, rest = number.divmod(100)
    words = "#{SMALL[hundreds]} hundred"
    case number
    when 0...20 then SMALL[number]
    when 20...100 then ones.zero? ? TENS[tens] : "#{TENS[tens]}-#{SMALL[ones]}"
    when 100...1000 then rest.zero? ? words : "#{words} #{in_english(rest)}"
    else
      scale, label = SCALES.find { number >= _1.first }
      high, low = number.divmod(scale)
      words = "#{in_english(high)} #{label}"
      low.zero? ? words : "#{words} #{in_english(low)}"
    end
  end
end
