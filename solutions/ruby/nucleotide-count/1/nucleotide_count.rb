# frozen_string_literal: true

require 'forwardable'

# Nucleotide
class Nucleotide
  attr_reader :dna

  extend Forwardable

  def_delegator :@dna, :count

  def initialize(dna)
    @dna = dna
  end

  def self.from_dna(dna)
    raise ArgumentError unless dna.chars.grep(/[^ATCG]/).empty?

    new(dna)
  end

  def histogram
    { 'A' => 0, 'T' => 0, 'C' => 0, 'G' => 0 }.merge(dna.chars.tally)
  end
end
