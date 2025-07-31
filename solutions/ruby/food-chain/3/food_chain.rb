#!/usr/bin/env ruby -w

class SwallowingLadyLyrics
  def each
    return enum_for(:each) unless block_given? # Sparkling magic!

    swallowed = []
    ANIMALS.each_cons(2) do |previous_animal, current_animal|
      yield i_know_she_swallowed_an(current_animal)
      yield comment(current_animal) if comment(current_animal)
      yield swallowed.unshift(she_swallowed(current_animal, previous_animal)).join("\n")
      yield ''
    end
    yield i_know_she_swallowed_an('horse')
    yield "She's dead, of course!"
    yield ''
  end

  private

  ANIMALS = %W( #{} fly spider bird cat dog goat cow )

  def i_know_she_swallowed_an(animal)
    "I know an old lady who swallowed a #{animal}."
  end

  def she_swallowed(an_animal, other)
    other_nickname = (other == 'spider') ? 'spider that wriggled and jiggled and tickled inside her' : other
    other.empty? ?
        "I don't know why she swallowed the fly. Perhaps she'll die." :
        "She swallowed the #{an_animal} to catch the #{other_nickname}."
  end

  def comment(animal)
    {
        spider: 'It wriggled and jiggled and tickled inside her.',
        bird:   'How absurd to swallow a bird!',
        cat:    'Imagine that, to swallow a cat!',
        dog:    'What a hog, to swallow a dog!',
        goat:   'Just opened her throat and swallowed a goat!',
        cow:    "I don't know how she swallowed a cow!"
    }[animal.to_sym]
  end

end

class SongComposer
  def initialize(lyrics)
    @lyrics = lyrics
  end

  def compose
    @lyrics.each.to_a.join("\n")
  end
end

class FoodChain
  VERSION = 2

  def self.song
    lyrics   = SwallowingLadyLyrics.new
    composer = SongComposer.new(lyrics)
    composer.compose
  end
end