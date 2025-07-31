#include "collatz_conjecture.h"

#include <stdexcept>

namespace collatz_conjecture {

int steps(int n) {
  if (n < 1)
    throw std::domain_error("underflow");

  int steps;
  for (steps = 0; n > 1; steps++) {
    if ((n & 1) == 0) { // even
      n >>= 1;          // ÷2
    } else {            // odd
      n = 3 * n + 1;    // 3n + 1
    }
  }
  return steps;
}

} // namespace collatz_conjecture
