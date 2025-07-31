const std = @import("std");
const mem = std.mem;

/// Returns the counts of the words in `s`.
/// Caller owns the returned memory.
pub fn countWords(allocator: mem.Allocator, s: []const u8) !std.StringHashMap(u32) {
    var map = std.StringHashMap(u32).init(allocator);

    const lower = try std.ascii.allocLowerString(allocator, s);
    defer allocator.free(lower);

    var it = mem.tokenizeAny(u8, lower, " .,\n\r\t:!@#$%^&*");
    while (it.next()) |word| {
        const w = mem.trim(u8, word, "'");
        if (w.len == 0) continue;

        const dup = try allocator.dupe(u8, w);
        const res = try map.getOrPut(dup);
        if (res.found_existing) {
            res.value_ptr.* += 1;
            allocator.free(dup);
        } else {
            res.value_ptr.* = 1;
        }
    }
    return map;
}
