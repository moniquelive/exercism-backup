const std = @import("std");

pub fn total(basket: []const u32) u32 {
    var books = [5]u32{ 0, 0, 0, 0, 0 };
    for (basket) |book| books[book - 1] += 1;
    std.mem.sort(u32, &books, {}, std.sort.asc(u32));

    var groups: [5]u32 = .{
        books[4] - books[3],
        books[3] - books[2],
        books[2] - books[1],
        books[1] - books[0],
        books[0],
    };

    const min = @min(groups[4], groups[2]);
    groups[4] -= min;
    groups[2] -= min;
    groups[3] += 2 * min;

    return 8 * (100 * groups[0] +
        95 * 2 * groups[1] +
        90 * 3 * groups[2] +
        80 * 4 * groups[3] +
        75 * 5 * groups[4]);
}
