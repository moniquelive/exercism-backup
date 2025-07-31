class BaseConverter
  def self.convert(in_base, digits, out_base)
    raise ArgumentError if in_base < 2 || out_base < 2
    raise ArgumentError if digits.any? { |d| d.negative? || d > in_base - 1 }

    base_10 = digits.reverse.each_with_index.reduce(0) do |acc, (digit, exp)|
      acc + digit * in_base.pow(exp)
    end

    [].tap do |arr|
      begin
        arr << base_10 % out_base
      end until (base_10 /= out_base).zero?
    end.reverse
  end
end
