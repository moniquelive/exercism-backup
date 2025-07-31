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
    if (items.len == 0) return 0;
    if (maximumWeight == 0) return 0;

    const buf_size = (items.len + 1) * (maximumWeight + 1);
    var buffer = try allocator.alloc(usize, buf_size);
    defer allocator.free(buffer);
    @memset(buffer, 0);

    var i: usize = 1;
    while (i <= items.len) : (i += 1) {
        var j: usize = 1;
        while (j <= maximumWeight) : (j += 1) {
            const curr_idx = i * (maximumWeight + 1) + j;
            const prev_idx = (i - 1) * (maximumWeight + 1) + j;

            if (items[i - 1].weight > j) {
                buffer[curr_idx] = buffer[prev_idx];
            } else {
                const prev_weight_idx = (i - 1) * (maximumWeight + 1) + (j - items[i - 1].weight);
                buffer[curr_idx] = @max(buffer[prev_idx], items[i - 1].value + buffer[prev_weight_idx]);
            }
        }
    }
    return buffer[items.len * (maximumWeight + 1) + maximumWeight];
}
