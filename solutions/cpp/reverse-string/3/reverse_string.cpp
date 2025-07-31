#include "reverse_string.h"

namespace reverse_string {

    string reverse_string(const string &str) {
        return string(rbegin(str), rend(str));
    }

}  // namespace reverse_string
