const std = @import("std");
const mem = std.mem;

pub const Item = struct {
    weight: usize,
    value: usize,

    pub fn init(weight: usize, value: usize) Item {
        return Item{
            .weight = weight,
            .value = value,
        };
    }
};

pub fn maximumValue(allocator: mem.Allocator, maximumWeight: usize, items: []const Item) !usize {
    var buffer = try allocator.alloc(usize, maximumWeight + 1);
    defer allocator.free(buffer);
    @memset(buffer, 0);

    for (items) |item| {
        var i = maximumWeight + 1;
        while (i > item.weight) {
            i -= 1;
            const value = item.value + buffer[i - item.weight];
            if (buffer[i] < value) {
                buffer[i] = value;
            }
        }
    }
    return buffer[maximumWeight];
}
