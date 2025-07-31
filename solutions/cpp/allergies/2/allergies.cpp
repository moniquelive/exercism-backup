#include "allergies.h"

namespace allergies {

static const std::map<std::string_view, unsigned int> allergies_ = {
    {"eggs", 1},      {"peanuts", 2},    {"shellfish", 4}, {"strawberries", 8},
    {"tomatoes", 16}, {"chocolate", 32}, {"pollen", 64},   {"cats", 128}};

allergy_test::allergy_test(unsigned int score) : score_(score) {}

bool allergy_test::is_allergic_to(std::string_view allergen) const {
  const auto it = allergies_.find(allergen);
  return (it != allergies_.end()) && (score_ & it->second);
}

std::unordered_set<std::string> allergy_test::get_allergies() const {
  std::unordered_set<std::string> allergies;
  for (auto [allergy, score] : allergies_)
    if (score_ & score)
      allergies.insert(std::string(allergy));
  return allergies;
}

} // namespace allergies
