const ascii = @import("std").ascii;
const mem = @import("std").mem;

pub fn isPangram(str: []const u8) bool {
    const nLetters = 'z' - 'a' + 1;
    var letters: [nLetters]bool = .{false} ** nLetters;
    for (str) |ch| {
        if (ascii.isAlphabetic(ch)) {
            letters[ascii.toLower(ch) - 'a'] = true;
        }
    }
    return mem.allEqual(bool, &letters, true);
}
