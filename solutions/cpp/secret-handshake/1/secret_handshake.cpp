#include <algorithm>
#include <string>
#include <vector>
#include "secret_handshake.h"

namespace secret_handshake {

std::vector<std::string> commands(int handshake) {
  std::vector<std::string> commands;
  if ((handshake & 0b0001) > 0) commands.emplace_back("wink");
  if ((handshake & 0b0010) > 0) commands.emplace_back("double blink");
  if ((handshake & 0b0100) > 0) commands.emplace_back("close your eyes");
  if ((handshake & 0b1000) > 0) commands.emplace_back("jump");
  if (handshake > 0b10000) std::reverse(begin(commands), end(commands));
  return commands;
}

} // namespace secret_handshake
