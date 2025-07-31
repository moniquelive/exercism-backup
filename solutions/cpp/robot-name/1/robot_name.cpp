#include "robot_name.h"
#include <functional>

namespace robot_name {

std::default_random_engine generator;

char robot::random_letter() const { return static_cast<char>(letters_gen()); }
char robot::random_digit() const { return static_cast<char>(digits_gen()); }

robot::robot()
    : letters_dist(std::uniform_int_distribution<int>('A', 'Z')),
      digits_dist(std::uniform_int_distribution<int>('0', '9')),
      letters_gen([this]() { return this->letters_dist(generator); }),
      digits_gen([this]() { return this->digits_dist(generator); }) {
  reset();
}

void robot::reset() {
  do
    _name = std::string({random_letter(), random_letter(),
                         random_digit(), random_digit(), random_digit()});
  while (_previous_names.contains(_name));
  _previous_names.insert(_name);
}

std::string robot::name() const { return _name; }
} // namespace robot_name
