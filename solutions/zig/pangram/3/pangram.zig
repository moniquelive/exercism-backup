const ascii = @import("std").ascii;
const mem = @import("std").mem;

pub fn isPangram(str: []const u8) bool {
    var letters: @Vector('z' - 'a' + 1, bool) = @splat(false);
    for (str) |ch| {
        if (ascii.isAlphabetic(ch)) {
            letters[ascii.toLower(ch) - 'a'] = true;
        }
    }
    return @reduce(.And, letters) == true;
}
