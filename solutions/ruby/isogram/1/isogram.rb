# frozen_string_literal: true

# Isogram class
class Isogram
  def self.isogram?(word)
    a_ord = 'a'.ord
    bloom = 0
    word.downcase.gsub(/[a-z]/).map { _1.ord - a_ord }.each do
      mask = 1 << _1
      return false if bloom & mask == mask

      bloom |= mask
    end
    true
  end
end
