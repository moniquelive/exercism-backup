#include "raindrops.h"

#include <sstream>

namespace raindrops {

    std::string convert(int n) {
        const bool by_3 = n % 3 == 0;
        const bool by_5 = n % 5 == 0;
        const bool by_7 = n % 7 == 0;

        std::stringstream ss;
        if (by_3) ss << "Pling";
        if (by_5) ss << "Plang";
        if (by_7) ss << "Plong";
        if (!by_3 && !by_5 && !by_7) ss << n;

        return ss.str();
    }

}  // namespace raindrops
