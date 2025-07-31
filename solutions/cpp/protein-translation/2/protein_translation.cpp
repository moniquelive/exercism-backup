#include "protein_translation.h"
#include <cassert>
#include <map>

namespace protein_translation {

static const std::map<std::string_view, std::string_view> codon2protein = {
    {"AUG", "Methionine"},
    {"UUU", "Phenylalanine"},
    {"UUC", "Phenylalanine"},
    {"UUA", "Leucine"},
    {"UUG", "Leucine"},
    {"UCU", "Serine"},
    {"UCC", "Serine"},
    {"UCA", "Serine"},
    {"UCG", "Serine"},
    {"UAU", "Tyrosine"},
    {"UAC", "Tyrosine"},
    {"UGU", "Cysteine"},
    {"UGC", "Cysteine"},
    {"UGG", "Tryptophan"},
    {"UAA", ""},
    {"UAG", ""},
    {"UGA", ""},
};
std::vector<std::string> proteins(std::string_view rna) {
  assert(rna.size() % 3 == 0);
  std::vector<std::string> proteins;
  for (size_t i = 0; i < rna.size(); i += 3) {
    const auto &codon = std::string(rna.substr(i, 3));
    const auto &protein = codon2protein.find(codon)->second;
    if (protein.empty())
      break;
    proteins.emplace_back(protein);
  }
  return proteins;
}

} // namespace protein_translation
