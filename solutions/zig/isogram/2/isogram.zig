const std = @import("std");
const ascii = @import("std").ascii;

pub fn isIsogram(str: []const u8) bool {
    var counter: u32 = 0;
    for (str) |c| {
        if (ascii.isAlphabetic(c)) {
            const pos = @as(u32, 1) <<| ascii.toLower(c) - 'a';
            if (counter & pos != 0) return false;
            counter |= pos;
        }
    }
    return true;
}
