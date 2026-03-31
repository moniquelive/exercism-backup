# frozen_string_literal: true

# module BookStore
module BookStore
  GROUP_PRICES = [0, 8.0, 15.2, 21.6, 25.6, 30.0].freeze

  def self.calculate_price(basket)
    counts = basket.tally.values_at(1, 2, 3, 4, 5).map(&:to_i).sort.reverse
    groups = counts.each_cons(2).map { _1 - _2 } << counts.last

    swaps = [groups[2], groups[4]].min
    groups[2] -= swaps
    groups[3] += swaps * 2
    groups[4] -= swaps

    groups.each_with_index.sum { |count, size| count * GROUP_PRICES[size + 1] }
  end
end
