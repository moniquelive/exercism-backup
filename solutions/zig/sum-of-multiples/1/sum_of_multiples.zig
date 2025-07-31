const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    if (limit < 2) return 0;

    var set = std.AutoHashMap(usize, void).init(allocator);
    defer set.deinit();

    for (factors) |f| {
        if (f > limit) continue;
        for (f..limit) |n| if (f > 0 and n % f == 0) {
            try set.put(n, void{});
        };
    }
    var s: usize = 0;
    var it = set.keyIterator();
    while (it.next()) |n| s += n.*;

    return @intCast(s);
}
