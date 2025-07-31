#include "gigasecond.h"

const boost::posix_time::seconds a_billion_seconds(1000000000);
boost::gregorian::date gigasecond::advance(const boost::gregorian::date& date) {
  const boost::posix_time::ptime posix_date(date);
  const boost::posix_time::ptime billionth_birthday(posix_date + a_billion_seconds);

  return billionth_birthday.date();
}