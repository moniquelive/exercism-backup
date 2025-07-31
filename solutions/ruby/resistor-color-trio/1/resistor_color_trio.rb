# frozen_string_literal: true

# ResistorColorTrio class
class ResistorColorTrio
  SCORES = %w[black brown red orange yellow green blue violet grey white].freeze

  def initialize(colors)
    raise ArgumentError unless (colors - SCORES).size.zero?

    @colors = colors[0..1]
    @zeroes = SCORES.index(colors[2])
  end

  def label
    kilo = score > 1000 ? 'kilo' : ''
    value = score > 1000 ? score / 1000 : score
    "Resistor value: #{value} #{kilo}ohms"
  end

  def score
    (@colors.map { SCORES.index(_1).to_s } + %w[0] * @zeroes)
      .join.to_i
  end
end
