const std = @import("std");
const mem = std.mem;

pub const Triplet = struct {
    a: usize,
    b: usize,
    c: usize,

    pub fn init(a: usize, b: usize, c: usize) Triplet {
        return Triplet{ .a = a, .b = b, .c = c };
    }
};

pub fn tripletsWithSum(allocator: mem.Allocator, n: usize) mem.Allocator.Error![]Triplet {
    var triplets = std.ArrayList(Triplet).init(allocator);
    for (3..n / 3) |a| {
        const b_plus_c = n - a;
        const b = (b_plus_c * b_plus_c - a * a) / (2 * b_plus_c);
        const c = n - a - b;
        if (a < b and a * a + b * b == c * c) {
            try triplets.append(Triplet.init(a, b, c));
        }
    }
    return triplets.toOwnedSlice();
}
