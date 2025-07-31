#ifndef _GIGASECOND_H_
#define _GIGASECOND_H_

#include <iostream>
#include "boost/date_time/gregorian/gregorian.hpp"
#include "boost/date_time/posix_time/posix_time.hpp"

namespace gigasecond {
  boost::gregorian::date advance(const boost::gregorian::date&);
};

#endif // _GIGASECOND_H_