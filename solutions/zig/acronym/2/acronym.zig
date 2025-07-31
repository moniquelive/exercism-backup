const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    var arr = std.ArrayList(u8).init(allocator);
    var it = mem.tokenize(u8, words, " _-");
    while (it.next()) |word|
        try arr.append(std.ascii.toUpper(word[0]));
    return arr.toOwnedSlice();
}
