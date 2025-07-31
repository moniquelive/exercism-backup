const std = @import("std");

pub const SeriesError = error{
    InvalidCharacter,
    NegativeSpan,
    InsufficientDigits,
};

pub fn largestProduct(digits: []const u8, span: i32) SeriesError!u64 {
    if (span < 0) return SeriesError.NegativeSpan;
    if (span > digits.len) return SeriesError.InsufficientDigits;
    if (digits.len == 0 or span == 0) return 1;

    var it = std.mem.window(u8, digits, @intCast(span), 1);
    var maxProd: u64 = 0;
    while (it.next()) |window| {
        var prod: u64 = 1;
        for (window) |d| {
            if (d < '0' or d > '9') return SeriesError.InvalidCharacter;

            prod *= d - '0';
        }
        if (maxProd < prod) maxProd = prod;
    }
    return maxProd;
}
