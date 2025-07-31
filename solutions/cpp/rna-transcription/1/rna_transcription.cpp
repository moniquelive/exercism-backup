#include "rna_transcription.h"

#include <algorithm>

namespace rna_transcription {

std::string to_rna(std::string_view dna_strand) {
  std::string rna_strand(dna_strand);
  std::transform(std::cbegin(dna_strand), std::cend(dna_strand),
                 std::begin(rna_strand), [](char c) { return to_rna(c); });
  return rna_strand;
}

char to_rna(char nucleotide) {
  switch (nucleotide) {
  case 'A':
    return 'U';
  case 'C':
    return 'G';
  case 'G':
    return 'C';
  case 'T':
    return 'A';
  default:
    throw "unexpected nucleotide";
  }
}

} // namespace rna_transcription
