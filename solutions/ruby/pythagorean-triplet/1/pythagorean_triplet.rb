module PythagoreanTriplet
  def self.triplets_with_sum(sum)
    (3..sum / 3).filter_map do |a|
      b_plus_c = sum - a
      b = (b_plus_c * b_plus_c - a * a) / (2 * b_plus_c)
      c = sum - a - b
      [a, b, c] if a < b && a * a + b * b == c * c
    end
  end
end
