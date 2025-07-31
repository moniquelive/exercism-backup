const ascii = @import("std").ascii;
const mem = @import("std").mem;

pub fn isPangram(str: []const u8) bool {
    var letters: [26]bool = [_]bool{false} ** 26;
    for (str) |ch| {
        if (ascii.isAlphabetic(ch)) {
            letters[ascii.toLower(ch) - 'a'] = true;
        }
    }
    return mem.allEqual(bool, &letters, true);
}
