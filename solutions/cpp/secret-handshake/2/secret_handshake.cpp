#include "secret_handshake.h"
#include <algorithm>
#include <map>

namespace secret_handshake {

std::vector<std::string> commands(unsigned int handshake) {
  static std::map<unsigned int, std::string> tbl = {
      {{0b0001U, "wink"},
       {0b0010U, "double blink"},
       {0b0100U, "close your eyes"},
       {0b1000U, "jump"}}};
  std::vector<std::string> commands;
  for (const auto &kv : tbl)
    if (handshake & kv.first)
      commands.emplace_back(kv.second);

  if (handshake & 0b10000U)
    std::reverse(begin(commands), end(commands));
  return commands;
}

} // namespace secret_handshake
