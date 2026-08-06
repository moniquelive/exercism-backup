# frozen_string_literal: true

module Chess
  FILES = ('A'..'H').freeze
  RANKS = (1..8).freeze

  def self.valid_square?(rank, file) = RANKS === rank && FILES === file
  def self.nickname(first_name, last_name) = (first_name[...2] + last_name[-2..]).upcase
  def self.move_message(first_name, last_name, square)
    nick = nickname(first_name, last_name)
    if valid_square?(square[1].to_i, square[0])
      "#{nick} moved to #{square}"
    else
      "#{nick} attempted to move to #{square}, but that is not a valid square"
    end
  end
end
