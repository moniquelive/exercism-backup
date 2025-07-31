#!/usr/bin/env ruby

module BookKeeping
  VERSION = 2
end

module Pangram
  ALL_CHARS = ('a'..'z').to_a

  def self.is_pangram?(sentence)
    sentence.downcase.scan(/[a-z]/).sort.uniq == ALL_CHARS
  end
end