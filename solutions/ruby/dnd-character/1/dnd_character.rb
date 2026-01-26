class DndCharacter
  attr_reader :constitution, :strength, :dexterity, :intelligence, :wisdom, :charisma, :hitpoints

  def self.modifier(input) = (input - 10) / 2
  def initialize
    rolls = 6.times.map { 4.times.map { Random.new.rand(1...6) }.sort[-3..].sum }
    @constitution, @strength, @dexterity, @intelligence, @wisdom, @charisma = *rolls
    @hitpoints = 10 + self.class.modifier(@constitution)
  end
end
