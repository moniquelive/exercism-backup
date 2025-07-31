#include "nucleotide_count.h"
#include <algorithm>
#include <stdexcept>

namespace nucleotide_count {

auto counter::findNucleotide(const counter::nucleotide_map_t::key_type &ch) const {
  const auto it = nucleotide_map_.find(ch);
  if (it == nucleotide_map_.end()) {
    throw std::invalid_argument("");
  }
  return it;
}

counter::counter(std::string_view sequence)
    : nucleotide_map_({{'A', 0}, {'T', 0}, {'C', 0}, {'G', 0}}) {
  std::for_each(sequence.begin(), sequence.end(),
                [this](const auto &ch) { findNucleotide(ch)->second++; });
}

counter::nucleotide_map_t counter::nucleotide_counts() const {
  return nucleotide_map_;
}

int counter::count(const char nucleotide) const {
  return findNucleotide(nucleotide)->second;
}

} // namespace nucleotide_count
