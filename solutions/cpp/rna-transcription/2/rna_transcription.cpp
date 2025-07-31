#include "rna_transcription.h"

#include <algorithm>
#include <stdexcept>

namespace rna_transcription {

struct unknown_nucleotide : public std::invalid_argument {
  unknown_nucleotide() : std::invalid_argument("unknown nucleotide") {}
};

std::string to_rna(std::string dna_strand) {
  std::transform(std::cbegin(dna_strand), std::cend(dna_strand),
                 std::begin(dna_strand), [](char c) { return to_rna(c); });
  return dna_strand;
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
    throw unknown_nucleotide();
  }
}

} // namespace rna_transcription
