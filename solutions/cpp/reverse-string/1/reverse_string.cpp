#include "reverse_string.h"

#include <algorithm>

using namespace std;

namespace reverse_string {

    string reverse_string(const string& str) {
        string result(str);
        reverse(begin(result), end(result));
        return result;
    }

}  // namespace reverse_string
