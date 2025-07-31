#!/usr/bin/env ruby -w

module FoodChain
  extend self

  VERSION = 2

  def an_old_lady_who_swallowed(something)
    "I know an old lady who swallowed a #{something}."
  end

  def i_dont_know
    "I don't know why she swallowed the fly. Perhaps she'll die."
  end

  def she_swallowed(something, why)
    "She swallowed the #{something} to catch the #{why}."
  end

  def conclusion
    "She's dead, of course!"
  end

  def spider_motion
    "wriggled and jiggled and tickled inside her"
  end

  def a_spider
    "spider that #{spider_motion}"
  end

  def the_spider
    "It #{spider_motion}."
  end

  def comment_bird
    "How absurd to swallow a bird!"
  end

  def comment_cat
    "Imagine that, to swallow a cat!"
  end

  def comment_dog
    "What a hog, to swallow a dog!"
  end

  def comment_goat
    "Just opened her throat and swallowed a goat!"
  end

  def comment_cow
    "I don't know how she swallowed a cow!"
  end

  def song
    [an_old_lady_who_swallowed('fly'),
     i_dont_know,
     '',
     an_old_lady_who_swallowed('spider'),
     the_spider,
     she_swallowed('spider', 'fly'),
     i_dont_know,
     '',
     an_old_lady_who_swallowed('bird'),
     comment_bird,
     she_swallowed('bird', a_spider),
     she_swallowed('spider', 'fly'),
     i_dont_know,
     '',
     an_old_lady_who_swallowed('cat'),
     comment_cat,
     she_swallowed('cat', 'bird'),
     she_swallowed('bird', a_spider),
     she_swallowed('spider', 'fly'),
     i_dont_know,
     '',
     an_old_lady_who_swallowed('dog'),
     comment_dog,
     she_swallowed('dog', 'cat'),
     she_swallowed('cat', 'bird'),
     she_swallowed('bird', a_spider),
     she_swallowed('spider', 'fly'),
     i_dont_know,
     '',
     an_old_lady_who_swallowed('goat'),
     comment_goat,
     she_swallowed('goat', 'dog'),
     she_swallowed('dog', 'cat'),
     she_swallowed('cat', 'bird'),
     she_swallowed('bird', a_spider),
     she_swallowed('spider', 'fly'),
     i_dont_know,
     '',
     an_old_lady_who_swallowed('cow'),
     comment_cow,
     she_swallowed('cow', 'goat'),
     she_swallowed('goat', 'dog'),
     she_swallowed('dog', 'cat'),
     she_swallowed('cat', 'bird'),
     she_swallowed('bird', a_spider),
     she_swallowed('spider', 'fly'),
     i_dont_know,
     '',
     an_old_lady_who_swallowed('horse'),
     conclusion,
     ''].join("\n")
  end
end