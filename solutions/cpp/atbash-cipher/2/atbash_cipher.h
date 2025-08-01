#if !defined(ATBASH_CIPHER_H)
#define ATBASH_CIPHER_H

#include <string>

namespace atbash_cipher {

std::string encode(std::string_view decoded);
std::string decode(std::string_view encoded);

} // namespace atbash_cipher

#endif // ATBASH_CIPHER_H