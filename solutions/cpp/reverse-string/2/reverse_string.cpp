#include "reverse_string.h"

#include <iterator>

using namespace std;

namespace reverse_string {

    string reverse_string(const string& str) {
        return string(
                make_reverse_iterator(end(str)),
                make_reverse_iterator(begin(str)));
    }

}  // namespace reverse_string
