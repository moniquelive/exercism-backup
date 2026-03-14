# frozen_string_literal: true

# module PigLatin
module PigLatin
  def self.translate(phrase) = phrase.gsub(/\w+/) { pig_latin(_1) }

  def self.pig_latin(word)
    return "#{word}ay" if word.match?(/^([aeiou]|xr|yt)/)

    word.sub(/^((?:[^aeiou]?qu|[^aeiouy]+|y))(.*)$/, '\\2\\1ay')
  end
  private_class_method :pig_latin
end
