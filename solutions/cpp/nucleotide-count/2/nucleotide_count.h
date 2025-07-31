#if !defined(NUCLEOTIDE_COUNT_H)
#define NUCLEOTIDE_COUNT_H

#include <map>
#include <string_view>

namespace nucleotide_count {

class counter {
  typedef std::map<char, int> nucleotide_map_t;
  mutable nucleotide_map_t nucleotide_map_;

  auto find_nucleotide(const char nucleotide) const;

public:
  explicit counter(std::string_view nucleotide);
  [[nodiscard]] const nucleotide_map_t& nucleotide_counts() const;
  int count(const char nucleotide) const;
};

} // namespace nucleotide_count

#endif // NUCLEOTIDE_COUNT_H