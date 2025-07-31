#!/usr/bin/env ruby

module BookKeeping
  VERSION = 2
end

#
module Pangram
  LOWER_ALPHABET = 'a'..'z'

  class << self
    def pangram?(sentence)
      downcased_sentence = sentence.downcase
      LOWER_ALPHABET.all? { |c| downcased_sentence.include? c }
    end
    alias is_pangram? pangram?
  end
end