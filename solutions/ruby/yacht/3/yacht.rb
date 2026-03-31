# frozen_string_literal: true

# class Yacht
class Yacht
  def initialize(dice, category) = (@dice = dice
                                    @category = category)

  def score = case @category
              when 'yacht' then @dice.tally.one? ? 50 : 0
              when 'full house' then @dice.tally.values.sort == [2, 3] ? @dice.sum : 0
              when 'four of a kind' then @dice.tally.find { _2 >= 4 }&.first.to_i * 4
              when 'little straight' then @dice.sort == [1, 2, 3, 4, 5] ? 30 : 0
              when 'big straight' then @dice.sort == [2, 3, 4, 5, 6] ? 30 : 0
              when 'choice' then @dice.sum
              else number = %w[ones twos threes fours fives sixes].index(@category) + 1
                   number * @dice.count(number)
              end
end
