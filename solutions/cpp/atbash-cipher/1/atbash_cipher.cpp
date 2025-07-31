#include "atbash_cipher.h"

#include <iostream>
#include <ranges>
#include <regex>
#include <sstream>

namespace atbash_cipher {

static bool valid_chars(char c) { return !isspace(c) && !ispunct(c); }

static char cipher(char c) {
  return !std::isalpha(c)  ? c
         : std::isupper(c) ? static_cast<char>(std::tolower('Z' - (c - 'A')))
                           : static_cast<char>('z' - (c - 'a'));
}

std::string encode(std::string_view decoded) {
  auto const re = std::regex(".{1,5}");
  std::string cleaned;
  std::ranges::copy(decoded
                        | std::views::filter(valid_chars)
                        | std::views::transform(cipher),
                    std::back_inserter(cleaned));
  std::stringstream join_ss;
  std::ranges::copy(
      std::sregex_token_iterator(cleaned.begin(), cleaned.end(), re),
      std::sregex_token_iterator(),
      std::ostream_iterator<std::string>(join_ss, " "));
  auto const joined = join_ss.str();
  return {joined.begin(), joined.end() - 1}; // get rid of dangling space
}

std::string decode(std::string_view encoded) {
  auto r =
      encoded | std::views::transform(cipher) | std::views::filter(valid_chars);
  return {r.begin(), r.end()};
}

} // namespace atbash_cipher
