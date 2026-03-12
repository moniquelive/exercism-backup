# frozen_string_literal: true

# class InvalidCodonError
class InvalidCodonError < StandardError; end

# module Translation
module Translation
  CODONS = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine', 'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine', 'UUG' => 'Leucine',
    'UCU' => 'Serine', 'UCC' => 'Serine', 'UCA' => 'Serine', 'UCG' => 'Serine',
    'UAU' => 'Tyrosine', 'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine', 'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP', 'UAG' => 'STOP', 'UGA' => 'STOP'
  }.freeze

  def self.of_rna(strand)
    strand.scan(/.{1,3}/).each_with_object([]) do |slice, acc|
      codon = CODONS[slice] || raise(InvalidCodonError)
      break acc if codon == 'STOP'

      acc << codon
    end
  end
end
