#include "robot_name.h"

namespace robot_name {

static std::unordered_set<std::string> used_names;

static std::default_random_engine generator;
static auto letters_dist = std::uniform_int_distribution<int>('A', 'Z');
static auto digits_dist = std::uniform_int_distribution<int>('0', '9');

static int letters_gen() { return letters_dist(generator); }
static int digits_gen() { return digits_dist(generator); }
static char random_letter() { return static_cast<char>(letters_gen()); }
static char random_digit() { return static_cast<char>(digits_gen()); }

robot::robot() { reset(); }
robot::~robot() { used_names.erase(_name); }

void robot::reset() {
  do
    _name = std::string({random_letter(), random_letter(),
                         random_digit(), random_digit(), random_digit()});
  while (used_names.contains(_name));
  used_names.insert(_name);
}

std::string robot::name() const { return _name; }
} // namespace robot_name
