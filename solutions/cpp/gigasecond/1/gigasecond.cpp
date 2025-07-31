#include "gigasecond.h"

boost::gregorian::date gigasecond::advance(const boost::gregorian::date&) {
}

friend std::ostream& operator<<(std::ostream& str, const gigasecond& data) {
  return str << data.name << "\n" << age << "\n";
}