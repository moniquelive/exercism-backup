#
class Series
  def initialize(string)
    @string = string
  end

  def slices(n)
    raise ArgumentError if n > @string.length

    @string.each_char.each_cons(n).flat_map(&:join)
  end
end