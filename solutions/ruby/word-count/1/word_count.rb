#!/usr/bin/env ruby -w

class Phrase
  attr_reader :word_count

  def initialize(phrase)
    @phrase = phrase
    @words  = @phrase.scan(/['\w]+/)
    @word_count = @words.each_with_object(Hash.new(0)) { |w, h| h[w.downcase] += 1 }
  end
end