#include "collatz_conjecture.h"

#include <stdexcept>

namespace collatz_conjecture {

int steps(int n) {
  if (n < 1)
    throw std::domain_error("invalid argument");

  int steps;
  for (steps = 0; n > 1; steps++) {
    if ((n % 2) == 0) {
      n /= 2;
    } else {
      n = 3 * n + 1;
    }
  }
  return steps;
}

} // namespace collatz_conjecture
