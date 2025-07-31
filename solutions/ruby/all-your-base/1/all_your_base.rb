class BaseConverter
  def self.convert(in_base, n, out_base)
    raise ArgumentError if in_base < 2 || out_base < 2
    raise ArgumentError if n.any? { |d| d.negative? || d > in_base - 1 }

    base_10 = (n.size-1).downto(0).zip(n).map { |e,d| d * (in_base ** e) }.sum

    [].tap do |arr|
      begin
        arr << base_10 % out_base
      end until (base_10 /= out_base).zero?
    end.reverse
  end
end
