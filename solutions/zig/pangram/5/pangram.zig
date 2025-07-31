const ascii = @import("std").ascii;

pub fn isPangram(str: []const u8) bool {
    var letters: u32 = 0;
    for (str) |ch| {
        if (ascii.isAlphabetic(ch)) {
            letters |= @as(u32, 1) << @truncate(ascii.toLower(ch) - 'a');
        }
    }
    return letters == 0x3ff_ffff; // 2 + 24
}
