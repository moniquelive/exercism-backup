#include "grains.h"

namespace grains {

    std::uint64_t square(int num) {
        return 1ULL << (num - 1);
    }

    std::uint64_t total() {
        //return -1ULL; // :)
        return static_cast<std::uint64_t>(-1);
    }

}  // namespace grains
