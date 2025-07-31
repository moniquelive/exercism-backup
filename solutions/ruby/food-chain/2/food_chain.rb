#!/usr/bin/env ruby -w

module SwallowingLady
  def i_know_she_swallowed(something)
    "I know an old lady who swallowed a #{something}."
  end

  def she_swallowed(an_animal, other)
    return "I don't know why she swallowed the fly. Perhaps she'll die." if other.empty?
    "She swallowed the #{an_animal} to catch the #{nickname(other)}."
  end

  def conclusion
    "She's dead, of course!"
  end

  def a_spider
    "spider that wriggled and jiggled and tickled inside her"
  end

  def comment(animal)
    {
        fly:    nil,
        spider: "It wriggled and jiggled and tickled inside her.",
        bird:   "How absurd to swallow a bird!",
        cat:    "Imagine that, to swallow a cat!",
        dog:    "What a hog, to swallow a dog!",
        goat:   "Just opened her throat and swallowed a goat!",
        cow:    "I don't know how she swallowed a cow!"
    }[animal.to_sym]
  end

  def nickname(animal)
    return animal unless animal == 'spider'
    'spider that wriggled and jiggled and tickled inside her'
  end
end

class SongComposer
  include SwallowingLady

  ANIMALS = %w( fly spider bird cat dog goat cow )

  def each_song_line
    previous_animal = ''
    swallowed       = ''
    ANIMALS.each do |animal|
      swallowed       = she_swallowed(animal, previous_animal) + "\n" + swallowed
      previous_animal = animal

      yield i_know_she_swallowed(animal)
      yield comment(animal)
      yield swallowed
    end
    yield i_know_she_swallowed('horse')
    yield conclusion
  end

  def compose
    retval = ''
    each_song_line do |current_line|
      retval << "%s\n" % current_line if current_line
    end
    retval
  end
end

class FoodChain
  VERSION = 2

  def self.song
    SongComposer.new.compose
  end
end