# frozen_string_literal: true

# class Yacht
class Yacht
  NUMBERS = %w[ones twos threes fours fives sixes].zip(1..6).to_h.freeze
  STRAIGHTS = {
    'little straight' => [1, 2, 3, 4, 5],
    'big straight' => [2, 3, 4, 5, 6]
  }.freeze

  attr_reader :score

  def initialize(dice, category) = @score = if (number = NUMBERS[category])
                                              number * dice.tally.fetch(number, 0)
                                            else
                                              score_hand(dice, category, dice.tally)
                                            end

  private

  def score_hand(dice, category, counts)
    case category
    when 'yacht' then counts.one? ? 50 : 0
    when 'full house' then counts.values.sort == [2, 3] ? dice.sum : 0
    when 'four of a kind' then counts.find { _2 >= 4 }&.first.to_i * 4
    when 'little straight', 'big straight' then dice.sort == STRAIGHTS[category] ? 30 : 0
    when 'choice' then dice.sum
    end || 0
  end
end
