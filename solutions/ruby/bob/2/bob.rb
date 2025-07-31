#!/usr/bin/env ruby -w

class Bob
  def hey(phrase)
    text_factory.create(phrase).response
  end
end

class TextFactory
  def initialize
    @types = []
  end

  def create(text)
    @types.each { |text_type| return text_type if text_type.is(text) }
  end

  def register(type)
    @types << type
  end
end

def text_factory
  $factory ||= TextFactory.new
end

class Silence
  def is(text)
    text.strip.empty?
  end

  def response
    'Fine. Be that way!'
  end
end

class Scream
  def is(text)
    text =~ /\w{2}/ && text == text.upcase
  end

  def response
    'Whoa, chill out!'
  end
end

class Question
  def is(text)
    text.end_with?('?')
  end

  def response
    'Sure.'
  end
end

class NoneOfTheAbove
  def is(_)
    true
  end

  def response
    'Whatever.'
  end
end

text_factory.register Silence.new
text_factory.register Scream.new
text_factory.register Question.new
text_factory.register NoneOfTheAbove.new