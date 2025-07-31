# frozen_string_literal: true

class IsbnVerifier
  def self.valid?(isbn)
    digits = isbn.upcase.gsub(/[^\dX]/,'').to_s
    return false if digits.length != 10
    return false if digits.include?('X') && digits.index('X') != 9
    chksum = 10.downto(1).zip(digits.chars).sum { |n,d| n * (d == 'X' ? 10 : d.to_i) } % 11
    chksum.zero?
  end
end
