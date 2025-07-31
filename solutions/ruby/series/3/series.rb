#
class Series
  def initialize(string)
    @string = string
  end

  def slices(n)
    raise ArgumentError if n > @string.length

    @string         # assuming n == 2 :
      .each_char    # ['s', 't', 'r', 'i', 'n', 'g']
      .each_cons(n) # [['s', 't'], ['r', 'i'], ['n', 'g']]
      .map(&:join)  # ['st', 'ri', ng']
  end
end