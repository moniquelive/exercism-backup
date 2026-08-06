# frozen_string_literal: true

# class DndCharacter
class DndCharacter
  attr_reader :constitution, :strength, :dexterity, :intelligence, :wisdom, :charisma, :hitpoints

  def self.modifier(input) = (input - 10) / 2

  def initialize
    rolls = 6.times.map { rand(3..18) }
    @constitution, @strength, @dexterity, @intelligence, @wisdom, @charisma = *rolls
    @hitpoints = 10 + self.class.modifier(@constitution)
  end
end
