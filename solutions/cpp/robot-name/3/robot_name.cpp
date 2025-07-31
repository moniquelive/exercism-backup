#include "robot_name.h"

#include <utility>

namespace robot_name {

static std::unordered_set<std::string> used_names;

static std::default_random_engine rng;
static auto letters_dist = std::uniform_int_distribution<int>('A', 'Z');
static auto digits_dist = std::uniform_int_distribution<int>('0', '9');

static char random_letter() { return static_cast<char>(letters_dist(rng)); }
static char random_digit() { return static_cast<char>(digits_dist(rng)); }

robot::robot() { reset(); }
robot::~robot() { used_names.erase(_name); }

robot::robot(robot &&other) noexcept // move constructor
    : _name(std::exchange(other._name, "")) {}

robot& robot::operator=(robot&& other) noexcept // move assignment
{
  std::swap(_name, other._name);
  return *this;
}

void robot::reset() {
  do
    _name = std::string({random_letter(), random_letter(),
                         random_digit(), random_digit(), random_digit()});
  while (used_names.contains(_name));
  used_names.insert(_name);
}

const std::string &robot::name() const { return _name; }
} // namespace robot_name
