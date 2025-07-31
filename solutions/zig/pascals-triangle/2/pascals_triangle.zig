const std = @import("std");
const mem = std.mem;

pub fn rows(allocator: mem.Allocator, n: usize) mem.Allocator.Error![][]u128 {
    var mat = try allocator.alloc([]u128, n);
    for (0..n) |row| {
        mat[row] = try allocator.alloc(u128, row + 1);
        for (0..row + 1) |i| {
            if (row == i or i == 0) {
                mat[row][i] = 1;
            } else {
                mat[row][i] = mat[row - 1][i - 1] + mat[row - 1][i];
            }
        }
    }
    return mat;
}
