const std = @import("std");
const mem = std.mem;

/// Returns the set of strings in `candidates` that are anagrams of `word`.
/// Caller owns the returned memory.
pub fn detectAnagrams(
    allocator: mem.Allocator,
    word: []const u8,
    candidates: []const []const u8,
) !std.BufSet {
    const lower_sorted_word = try std.ascii.allocLowerString(allocator, word);
    defer allocator.free(lower_sorted_word);
    std.mem.sort(u8, lower_sorted_word, {}, std.sort.asc(u8));

    var buf = std.BufSet.init(allocator);
    for (candidates) |candidate| {
        if (std.ascii.eqlIgnoreCase(word, candidate)) continue;

        const lower_sorted_candidate = try std.ascii.allocLowerString(allocator, candidate);
        defer allocator.free(lower_sorted_candidate);
        std.mem.sort(u8, lower_sorted_candidate, {}, std.sort.asc(u8));

        if (!mem.eql(u8, lower_sorted_word, lower_sorted_candidate)) continue;

        try buf.insert(candidate);
    }
    return buf;
}
