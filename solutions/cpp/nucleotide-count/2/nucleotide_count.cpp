#include "nucleotide_count.h"
#include <algorithm>
#include <stdexcept>

namespace nucleotide_count {

auto counter::find_nucleotide(const char nucleotide) const {
  const auto it = nucleotide_map_.find(nucleotide);
  if (it == nucleotide_map_.end()) {
    throw std::invalid_argument("invalid nucleotide");
  }
  return it;
}

counter::counter(std::string_view sequence)
    : nucleotide_map_({{'A', 0}, {'T', 0}, {'C', 0}, {'G', 0}}) {
  std::for_each(sequence.begin(), sequence.end(),
                [this](const auto nucleotide) { find_nucleotide(nucleotide)->second++; });
}

const counter::nucleotide_map_t& counter::nucleotide_counts() const {
  return nucleotide_map_;
}

int counter::count(const char nucleotide) const {
  return find_nucleotide(nucleotide)->second;
}

} // namespace nucleotide_count
