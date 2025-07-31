const std = @import("std");
const ascii = @import("std").ascii;

pub fn isIsogram(str: []const u8) bool {
    var counter = [_]usize{0} ** 26;
    for (str) |c| {
        if (ascii.isAlphabetic(c)) {
            counter[ascii.toLower(c) - 'a'] += 1;
        }
    }
    return std.mem.indexOfNone(usize, &counter, &[_]usize{ 0, 1 }) == null;
}
