class Triangle
  def initialize(tri)
    @a, @b, @c = *tri
  end

  def equilateral?
    !a.zero? &&
      (a == b && b == c)
  end

  def isosceles?
    !a.zero? &&
      inequality? && (a == b || b == c || a == c)
  end

  def scalene?
    inequality? && (a != b && b != c)
  end

private
  attr_reader :a, :b, :c

  def inequality?
    a + b >= c &&
      a + c >= b &&
      b + c >= a
  end
end

