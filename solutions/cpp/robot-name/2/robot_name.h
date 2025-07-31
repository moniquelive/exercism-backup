#if !defined(ROBOT_NAME_H)
#define ROBOT_NAME_H

#include <random>
#include <string>
#include <unordered_set>

namespace robot_name {

class robot {
  std::string _name;

public:
  robot operator=(const robot &) = delete;
  robot(const robot &) = delete;
  robot();
  ~robot();

  [[nodiscard]] std::string name() const;
  void reset();
};

} // namespace robot_name

#endif // ROBOT_NAME_H