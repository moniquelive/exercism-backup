# frozen_string_literal: true

# module BottleSong
module BottleSong
  NUMBERS = %w[no one two three four five six seven eight nine ten].freeze

  def self.recite(start_bottles, take_down) =
    start_bottles
      .downto(start_bottles - take_down + 1)
      .map { verse(_1) }
      .join("\n")

  def self.verse(count) =
    <<~VERSE
      #{bottles(count).capitalize} hanging on the wall,
      #{bottles(count).capitalize} hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be #{bottles(count - 1)} hanging on the wall.
    VERSE

  def self.bottles(count) = "#{NUMBERS[count]} green bottle#{'s' unless count == 1}"
end
