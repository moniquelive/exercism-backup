const std = @import("std");
const mem = std.mem;

pub fn rows(allocator: mem.Allocator, n: usize) mem.Allocator.Error![][]u128 {
    var mat = std.ArrayList([]u128).init(allocator);
    for (0..n) |row| {
        var arr = std.ArrayList(u128).init(allocator);
        for (0..row + 1) |i| {
            if (row == i or i == 0) {
                try arr.append(1);
            } else {
                try arr.append(mat.items[row - 1][i - 1] + mat.items[row - 1][i]);
            }
        }
        try mat.append(try arr.toOwnedSlice());
    }
    return mat.toOwnedSlice();
}
