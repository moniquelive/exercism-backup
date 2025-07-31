#include "raindrops.h"
#include <array>

namespace raindrops {

    using namespace std;

    array<pair<int, string>, 3> sounds = {
            make_pair(3, "Pling"),
            make_pair(5, "Plang"),
            make_pair(7, "Plong"),
    };

    string convert(int n) {
        string str;
        for (const auto &s: sounds) {
            if (n % s.first == 0)
                str += s.second;
        }
        return str.empty() ? to_string(n) : str;
    }

}  // namespace raindrops
