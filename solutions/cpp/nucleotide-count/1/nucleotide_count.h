#if !defined(NUCLEOTIDE_COUNT_H)
#define NUCLEOTIDE_COUNT_H

#include <map>
#include <string_view>

namespace nucleotide_count {

class counter {
  typedef std::map<char, int> nucleotide_map_t;
  mutable nucleotide_map_t nucleotide_map_;

  auto findNucleotide(const nucleotide_map_t::key_type &ch) const;

public:
  explicit counter(std::string_view sequence);
  [[nodiscard]] nucleotide_map_t nucleotide_counts() const;
  int count(const char) const;
};

} // namespace nucleotide_count

#endif // NUCLEOTIDE_COUNT_H