#include "sum_of_multiples.h"
#include <algorithm>
#include <numeric>
#include <ranges>

namespace sum_of_multiples {

auto multiple_of(const auto &factors) {
  return [&factors](int n) {
    return std::any_of(std::begin(factors), std::end(factors),
                       [n](int f) { return n % f == 0; });
  };
}

int to(const std::vector<int> &factors, int n) {
  auto rng = std::views::iota(0, n) | std::views::filter(multiple_of(factors));
  return std::accumulate(std::begin(rng), std::end(rng), 0);
}

} // namespace sum_of_multiples
