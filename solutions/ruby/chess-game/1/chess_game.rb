# frozen_string_literal: true

module Chess
  FILES = ('A'..'H').freeze
  RANKS = (1..8).freeze

  def self.valid_square?(rank, file) = RANKS.include?(rank) && FILES.include?(file)
  def self.nickname(first_name, last_name) = (first_name[...2] + last_name[-2..]).upcase
  def self.move_message(first_name, last_name, square)
    nick = nickname(first_name, last_name)
    return "#{nick} attempted to move to #{square}, but that is not a valid square" \
      unless valid_square?(square[1].to_i, square[0])

    "#{nick} moved to #{square}"
  end
end
