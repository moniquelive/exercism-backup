module BookKeeping
  VERSION = 2
end

class Binary
  attr_reader :to_decimal

  def initialize(binary)
    raise ArgumentError if binary =~ /[^01]+/
    exps        = (binary.size - 1).downto(0).to_a
    factors     = binary.chars.zip(exps).map { |d, exp| d.to_i * (2**exp) }
    @to_decimal = factors.reduce(&:+)
  end
end