#include "raindrops.h"
#include <array>

namespace raindrops {

    using namespace std;

    const array<pair<int, string>, 3> sounds = {{{3, "Pling"},
                                                 {5, "Plang"},
                                                 {7, "Plong"},
                                                }};

    string convert(int n) {
        string str;
        for (const auto &s: sounds) {
            if (n % s.first == 0)
                str += s.second;
        }
        return str.empty() ? to_string(n) : str;
    }

}  // namespace raindrops
