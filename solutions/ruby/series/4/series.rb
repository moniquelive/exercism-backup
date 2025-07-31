#
class Series
  def initialize(string)
    @string = string
  end

  def slices(n)
    raise ArgumentError if n > @string.length

    @string         # assuming n == 2 :
      .each_char    # %w(s t r i n g)
      .each_cons(n) # [%w(s t), %w(t r), %w(r i), %w(i n), %w(n g)]
      .map(&:join)  # %w(st tr ri in ng)
  end
end
