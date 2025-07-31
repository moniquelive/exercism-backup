#if !defined(ALLERGIES_H)
#define ALLERGIES_H

#include <map>
#include <string>
#include <string_view>
#include <unordered_set>

namespace allergies {

class allergy_test {
  unsigned int score_;

public:
  explicit allergy_test(unsigned int score);
  [[nodiscard]] bool is_allergic_to(std::string_view allergen) const;
  [[nodiscard]] std::unordered_set<std::string> get_allergies() const;
};

} // namespace allergies

#endif // ALLERGIES_H