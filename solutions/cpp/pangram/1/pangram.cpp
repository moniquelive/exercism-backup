#include "pangram.h"

namespace pangram {

    static const int _26_ones = (1 << 26) - 1;

    bool is_pangram(const char *str) {
        int mask = 0;
        for (; *str; str++) {
            if (*str >= 'A' && *str <= 'Z') {
                mask |= (1 << (*str - 'A'));
            }
            if (*str >= 'a' && *str <= 'z') {
                mask |= (1 << (*str - 'a'));
            }
        }
        return (mask & _26_ones) == _26_ones;
    }

}  // namespace pangram
