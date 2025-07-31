#include <stdexcept>
#include "triangle.h"

namespace triangle {

    flavor kind(float a, float b, float c) {
        if (0 == a || 0 == b || 0 == c) {
            throw std::domain_error("null sided triangle");
        }
        if (a > b + c || b > a + c || c > a + b) {
            throw std::domain_error("triangle inequality invalidadated");
        }
        if (a == b && b == c) {
            return flavor::equilateral;
        }
        if (a == b || b == c || a == c) {
            return flavor::isosceles;
        }
        return flavor::scalene;
    }

}  // namespace triangle
