#include "prime_factors.h"
#include <cmath>

namespace prime_factors {

factors_t of(int n) {
  factors_t factors;
  // two is the only even prime
  while (n % 2 == 0) {
    factors.push_back(2);
    n /= 2;
  }
  // skip 2 factors at a time
  for (int factor = 3, sqrt_n = (int)sqrt(n); factor <= sqrt_n; factor += 2)
    while (n % factor == 0) {
      factors.push_back(factor);
      n /= factor;
    }
  // add itself if different from 2
  if (n > 2) {
    factors.push_back(n);
  }
  return factors;
}

} // namespace prime_factors
