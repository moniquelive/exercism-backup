#include <cstdlib>
#include <cstring>
#include <stdexcept>
#include "hamming.h"

using namespace std;

namespace hamming {
  int compute(const char* dna1, const char* dna2) {
    if (strlen(dna1) != strlen(dna2))
      throw domain_error("strands length mismatch");

    int diffs = 0;
    for (; *dna1; ++dna1, ++dna2)
      diffs += (*dna1 != *dna2) ? 1 : 0;
    return diffs;
  }
}