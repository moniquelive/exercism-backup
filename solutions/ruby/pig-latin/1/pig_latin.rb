# frozen_string_literal: true

# module PigLatin
module PigLatin
  def self.translate(phrase) = phrase
    .split
    .map { pig_latin(_1) }
    .join(' ')

  def self.pig_latin(word)
    return "#{word}ay" if word.match?(/^([aeiou]|xr|yt)/)

    word.sub(/^((?:[^aeiou]?qu|[^aeiouy]+|y))(.*)$/, '\\2\\1ay')
  end
  private_class_method :pig_latin
end
