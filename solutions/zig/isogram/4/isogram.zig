const std = @import("std");
const ascii = std.ascii;

pub fn isIsogram(str: []const u8) bool {
    var charSet = std.StaticBitSet(32).initEmpty();
    for (str) |c| if (ascii.isAlphabetic(c)) {
        const index = ascii.toLower(c) - 'a';
        if (charSet.isSet(index))
            return false;
        charSet.set(index);
    };
    return true;
}
