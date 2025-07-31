const std = @import("std");
const mem = std.mem;

pub fn sum(allocator: mem.Allocator, factors: []const u32, limit: u32) !u64 {
    if (limit < 2) return 0;

    var set = std.AutoHashMap(usize, void).init(allocator);
    defer set.deinit();

    for (factors) |f| {
        if (f == 0) continue;
        var n = f;
        while (n < limit) : (n += f)
            try set.put(n, void{});
    }
    var s: u64 = 0;
    var it = set.keyIterator();
    while (it.next()) |n| s += n.*;

    return s;
}
