const std = @import("std");

pub fn isValid(s: []const u8) bool {
    var heapSpace: [128]u8 = undefined;
    var alloc = std.heap.FixedBufferAllocator.init(&heapSpace);

    var arr = std.ArrayList(u8).init(alloc.allocator());
    defer arr.deinit();

    for (s) |c| {
        if (c == ' ') continue;
        if (c < '0' or c > '9') return false;
        arr.append(c - '0') catch unreachable;
    }

    const buffer = arr.items;
    if (buffer.len < 2) return false;

    var sum: usize = 0;
    for (0..buffer.len) |i| {
        const c = buffer[buffer.len - i - 1];

        if (i % 2 == 0) {
            sum += c;
        } else {
            const temp: usize = c * 2;
            sum += if (temp > 9) temp - 9 else temp;
        }
    }
    return sum % 10 == 0;
}
