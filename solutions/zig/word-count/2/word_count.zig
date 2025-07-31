const std = @import("std");
const mem = std.mem;

pub fn countWords(allocator: mem.Allocator, s: []const u8) !std.StringHashMap(u32) {
    var map = std.StringHashMap(u32).init(allocator);
    var it = mem.tokenizeAny(u8, s, std.ascii.whitespace ++ ".,:!@#$%^&*");
    while (it.next()) |word| {
        const trimmed = mem.trim(u8, word, "'");
        if (trimmed.len == 0) continue;
        const lower = try std.ascii.allocLowerString(allocator, trimmed);
        const res = try map.getOrPut(lower);
        if (res.found_existing) {
            allocator.free(lower);
            res.value_ptr.* += 1;
        } else {
            res.value_ptr.* = 1;
        }
    }
    return map;
}
