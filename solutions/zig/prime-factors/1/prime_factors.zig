const std = @import("std");
const mem = std.mem;

pub fn factors(allocator: mem.Allocator, value: u64) mem.Allocator.Error![]u64 {
    var result = std.ArrayList(u64).init(allocator);
    var n = value;

    while (n % 2 == 0) : (n /= 2) {
        try result.append(2);
    }

    var d: u64 = 3;
    while (d * d <= n) : (d += 2) {
        while (n % d == 0) : (n /= d) {
            try result.append(d);
        }
    }
    if (n > 2)
        try result.append(n);
    return result.toOwnedSlice();
}
