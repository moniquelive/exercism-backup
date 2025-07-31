const std = @import("std");
const mem = std.mem;

const tbl = [_]struct { n: i16, s: []const u8 }{
    .{ .n = 1000, .s = "M" },
    .{ .n = 900, .s = "CM" },
    .{ .n = 500, .s = "D" },
    .{ .n = 400, .s = "CD" },
    .{ .n = 100, .s = "C" },
    .{ .n = 90, .s = "XC" },
    .{ .n = 50, .s = "L" },
    .{ .n = 40, .s = "XL" },
    .{ .n = 10, .s = "X" },
    .{ .n = 9, .s = "IX" },
    .{ .n = 5, .s = "V" },
    .{ .n = 4, .s = "IV" },
    .{ .n = 1, .s = "I" },
};

pub fn toRoman(allocator: mem.Allocator, arabicNumeral: i16) mem.Allocator.Error![]u8 {
    var arr = std.ArrayList(u8).init(allocator);
    var n = arabicNumeral;
    while (n >= 1) {
        var i: usize = 0;
        while (n < tbl[i].n) : (i += 1) {}

        try arr.appendSlice(tbl[i].s);
        n -= tbl[i].n;
    }
    return arr.toOwnedSlice();
}
