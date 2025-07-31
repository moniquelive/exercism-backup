#pragma once
#include <iostream>
#include <boost/date_time/gregorian/gregorian_types.hpp>

class gigasecond {
public:
  static boost::gregorian::date advance(const boost::gregorian::date&);
  friend std::ostream& operator<<(std::ostream& str, const gigasecond& data);
};