#include <stdexcept>
#include <limits>
#include <array>
#include <algorithm>
#include "triangle.h"

namespace triangle {

    bool epsilon_cmp(double x, double y, int decimal_places) {
        // the machine epsilon has to be scaled to the magnitude of the values used
        // and multiplied by the desired precision in decimal places
        return std::abs(x - y) <= std::numeric_limits<double>::epsilon() * std::abs(x + y) * decimal_places
               // unless the result is subnormal
               || std::abs(x - y) < std::numeric_limits<double>::min();
    }

    flavor kind(double a, double b, double c) {
        static const int precision = 10;

        if (epsilon_cmp(a, 0, precision) || epsilon_cmp(b, 0, precision) || epsilon_cmp(c, 0, precision)) {
            throw std::domain_error("null sided triangle");
        }

        {
            std::array<double, 3> params = {a, b, c};
            std::sort(std::begin(params), std::end(params));
            if (params[2] >= params[0] + params[1]) {
                throw std::domain_error("triangle inequality invalidadated");
            }
        }

        if (epsilon_cmp(a, b, precision) && epsilon_cmp(b, c, precision)) {
            return flavor::equilateral;
        }
        if (epsilon_cmp(a, b, precision) || epsilon_cmp(b, c, precision) ||
            epsilon_cmp(a, c, precision)) {
            return flavor::isosceles;
        }
        return flavor::scalene;
    }

}  // namespace triangle
