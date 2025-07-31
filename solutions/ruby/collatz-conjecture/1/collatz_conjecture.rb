# CollatzConjecture class
class CollatzConjecture
  def self.steps(n, steps=0)
    raise ArgumentError if n < 1

    return n == 1 ? steps
           : n.even? ? self.steps(n / 2, steps + 1)
           : n.odd? ? self.steps(n * 3 + 1, steps + 1)
           : '?'
  end
end
