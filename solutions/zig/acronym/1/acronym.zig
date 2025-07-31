const std = @import("std");
const mem = std.mem;

pub fn abbreviate(allocator: mem.Allocator, words: []const u8) mem.Allocator.Error![]u8 {
    const w = try allocator.alloc(u8, words.len);
    defer allocator.free(w);
    @memcpy(w, words);

    mem.replaceScalar(u8, w, '_', ' ');
    mem.replaceScalar(u8, w, ',', ' ');
    mem.replaceScalar(u8, w, '-', ' ');
    mem.replaceScalar(u8, w, '\'', '_');

    var arr = std.ArrayList(u8).init(allocator);

    var it = mem.tokenizeScalar(u8, w, ' ');
    while (it.next()) |word| {
        if (word.len == 0) continue;
        try arr.append(std.ascii.toUpper(word[0]));
    }
    return arr.toOwnedSlice();
}
