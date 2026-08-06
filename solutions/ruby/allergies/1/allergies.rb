# frozen_string_literal: true

KEYS = %w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats].freeze
VALUES = [1, 2, 4, 8, 16, 32, 64, 128].freeze
ALLERGENS = Hash[KEYS.zip(VALUES)]

# class Allergies
class Allergies
  def initialize(score) = @score = score
  def allergic_to?(which) = (@score & ALLERGENS[which]).positive?
  def list = KEYS.filter { allergic_to?(_1) }
end
