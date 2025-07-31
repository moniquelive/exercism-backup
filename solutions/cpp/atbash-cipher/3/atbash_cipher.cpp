#include "atbash_cipher.h"

#include <iostream>
#include <ranges>
#include <regex>
#include <sstream>

namespace atbash_cipher {

static bool valid_chars(unsigned char c) { return !isspace(c) && !ispunct(c); }

static char cipher(char c) {
  return !std::isalpha(c)  ? c
         : std::isupper(c) ? static_cast<char>(std::tolower('Z' - (c - 'A')))
                           : static_cast<char>('z' - (c - 'a'));
}

static std::string join(auto const &first, auto const &last, const char *sep) {
  std::stringstream ss;
  std::copy(first, last, std::ostream_iterator<std::string>(ss, sep));
  const std::string joined = ss.str();
  return joined.substr(0, joined.size() - strlen(sep));
}

std::string encode(std::string_view decoded) {
  auto rng =
      decoded | std::views::filter(valid_chars) | std::views::transform(cipher);
  const std::string cleaned(rng.begin(), rng.end());
  const std::regex re(".{1,5}"); // std::views::chunk where are you?
  return join(std::sregex_token_iterator(cleaned.begin(), cleaned.end(), re),
              std::sregex_token_iterator(), " ");
}

std::string decode(std::string_view encoded) {
  auto rng =
      encoded | std::views::transform(cipher) | std::views::filter(valid_chars);
  return std::string(rng.begin(), rng.end());
}

} // namespace atbash_cipher
