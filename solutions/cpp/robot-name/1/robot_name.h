#if !defined(ROBOT_NAME_H)
#define ROBOT_NAME_H

#include <functional>
#include <random>
#include <string>
#include <unordered_set>

namespace robot_name {

class robot {
  std::unordered_set<std::string> _previous_names;
  std::string _name;
  std::uniform_int_distribution<int> letters_dist;
  std::uniform_int_distribution<int> digits_dist;
  std::function<int()> letters_gen;
  std::function<int()> digits_gen;
  char random_letter() const;
  char random_digit() const;

public:
  robot();

  [[nodiscard]] std::string name() const;
  void reset();
};

} // namespace robot_name

#endif // ROBOT_NAME_H