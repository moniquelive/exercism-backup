#include "leap.h"

namespace leap {
  bool is_leap_year(const int year) {
    // on every year that is evenly divisible by 4
    //   except every year that is evenly divisible by 100
    //     unless the year is also evenly divisible by 400
    if (year % 100 == 0 && year % 400 != 0) return false;
    return (year % 4 == 0);
  }
}