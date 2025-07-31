#include "all_your_base.h"

#include <algorithm>
#include <numeric>
#include <cmath>

namespace all_your_base {
    using namespace std;

    unsigned int to_int(const vector<unsigned int> &digits, int base) {
        unsigned int e = 0;
        return accumulate(digits.rbegin(), digits.rend(), 0, [&e, base](unsigned int acc, unsigned int digit) {
            return acc + (pow(base, e++) * digit);
        });
    }

    auto to_base(unsigned int i, int base) {
        vector<unsigned int> c;
        for (; i > 0; i /= base) {
            c.push_back(i % base);
        }
        ranges::reverse(c);
        return c;
    }

    vector<unsigned int> convert(int input_base, const vector<unsigned int> &digits, int output_base) {
        if (input_base < 2) throw invalid_argument("input_base < 2");
        if (output_base < 2) throw invalid_argument("output_base < 2");

        const auto predicate = [input_base](int x) { return x < 0 || x >= input_base; };
        if (any_of(digits.begin(), digits.end(), predicate)) throw invalid_argument("invalid digit");

        return to_base(
                to_int(digits, input_base),
                output_base);
    }
}  // namespace all_your_base
