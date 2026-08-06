# frozen_string_literal: true

# class Poker
class Poker
  RANKS = Hash[(2..10).map(&:to_s).zip(2..10)].merge('J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14).freeze
  KIND_RANKS = {
    [4, 1] => 7,
    [3, 2] => 6,
    [3, 1, 1] => 3,
    [2, 2, 1] => 2,
    [2, 1, 1, 1] => 1
  }.freeze
  attr_reader :best_hand

  def initialize(hands) = @best_hand = hands.group_by { hand_score(_1) }.max.last

  private

  def hand_score(hand)
    ranks, suits = hand.map { [RANKS.fetch(_1.chop), _1[-1]] }.transpose
    groups = ranks.tally.sort_by { |rank, count| [-count, -rank] }
    grouped_ranks = groups.map(&:first)
    grouped_counts = groups.map(&:last)
    straight_high_card = straight_high_card(ranks)
    flush = suits.uniq.one?
    return [8, straight_high_card] if flush && straight_high_card
    return [5, *ranks.sort.reverse] if flush
    return [4, straight_high_card] if straight_high_card
    return [KIND_RANKS[grouped_counts], *grouped_ranks] if KIND_RANKS[grouped_counts]

    [0, *ranks.sort.reverse]
  end

  def straight_high_card(ranks)
    unique_sorted_ranks = ranks.uniq.sort
    return 5 if unique_sorted_ranks == [2, 3, 4, 5, 14]

    unique_sorted_ranks.last if unique_sorted_ranks.size == 5 &&
                                unique_sorted_ranks.each_cons(2).all? { |a, b| b == a + 1 }
  end
end
