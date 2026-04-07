# frozen_string_literal: true

# class Knapsack
class Knapsack
  def initialize(max_weight) = @max_weight = max_weight

  def max_value(items)
    dp = Array.new(@max_weight + 1, 0)
    items.each do |item|
      @max_weight.downto(item.weight) do |capacity|
        dp[capacity] = [dp[capacity], dp[capacity - item.weight] + item.value].max
      end
    end
    dp[@max_weight]
  end
end
