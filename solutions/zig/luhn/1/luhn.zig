const std = @import("std");

pub fn isValid(s: []const u8) bool {
    var buffer = std.ArrayList(u8).init(std.heap.page_allocator);
    defer buffer.deinit();

    for (s) |c| {
        if (c == ' ') continue;
        if (c < '0' or c > '9') return false;
        buffer.append(c - '0') catch unreachable;
    }

    if (buffer.items.len < 2) return false;

    var sum: usize = 0;
    for (0..buffer.items.len) |i| {
        const c = buffer.items[buffer.items.len - i - 1];

        if (i % 2 == 0) {
            sum += c;
        } else {
            const temp: usize = c * 2;
            sum += if (temp > 9) temp - 9 else temp;
        }
    }
    return sum % 10 == 0;
}
