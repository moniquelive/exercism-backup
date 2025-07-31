#include "pangram.h"

#include <bitset>

namespace pangram {

    bool is_pangram(const char *str) {
        std::bitset<26> mask;
        for (; *str; str++) {
            if (*str >= 'A' && *str <= 'Z')
                mask.set(*str - 'A');
            if (*str >= 'a' && *str <= 'z')
                mask.set(*str - 'a');
        }
        return mask.all();
    }

}  // namespace pangram
