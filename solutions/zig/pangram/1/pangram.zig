const ascii = @import("std").ascii;
const mem = @import("std").mem;

pub fn isPangram(str: []const u8) bool {
    var letters: [26]bool = [false]**26;
    for (str) |ch| {
        const c = ascii.toLower(ch);
        if (ascii.isAlphabetic(c) and c >= 'a' and c <= 'z') {
            letters[c - 'a'] = true;
        }
    }
    return mem.allEqual(bool, &letters, true);
}
