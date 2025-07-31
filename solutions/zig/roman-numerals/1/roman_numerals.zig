const std = @import("std");
const mem = std.mem;

const tbl: [13]struct { k: i16, v: []const u8 } = .{
    .{ .k = 1000, .v = "M" },
    .{ .k = 900, .v = "CM" },
    .{ .k = 500, .v = "D" },
    .{ .k = 400, .v = "CD" },
    .{ .k = 100, .v = "C" },
    .{ .k = 90, .v = "XC" },
    .{ .k = 50, .v = "L" },
    .{ .k = 40, .v = "XL" },
    .{ .k = 10, .v = "X" },
    .{ .k = 9, .v = "IX" },
    .{ .k = 5, .v = "V" },
    .{ .k = 4, .v = "IV" },
    .{ .k = 1, .v = "I" },
};

pub fn toRoman(allocator: mem.Allocator, arabicNumeral: i16) mem.Allocator.Error![]u8 {
    var arr = std.ArrayList(u8).init(allocator);
    var n = arabicNumeral;
    while (n >= 1) {
        var i: usize = 0;
        while (n < tbl[i].k) : (i += 1) {}

        try arr.appendSlice(tbl[i].v);
        n -= tbl[i].k;
    }
    return arr.toOwnedSlice();
}
