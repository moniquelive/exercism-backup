#!/usr/bin/env ruby -w

class Bob
  def hey(phrase)
    Text.new(phrase).respond
  end
end

class Text
  def initialize(text)
    kind_of_message = kind(text)
    @respond        = {
        silence:  'Fine. Be that way!',
        scream:   'Whoa, chill out!',
        question: 'Sure.'
    }.fetch(kind_of_message, 'Whatever.')
  end

  attr_reader :respond

  private

  def kind(text)
    is_it(:silence) { text.strip.empty? } \
        or is_it(:scream) { text =~ /\w{2}/ && text == text.upcase } \
        or is_it(:question) { text.end_with?('?') } \
        or is_it(:none_of_the_above) { true }
  end

  def is_it(kind)
    kind if yield
  end
end