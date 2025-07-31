const std = @import("std");
const mem = std.mem;

pub const ConversionError = error{
    InvalidInputBase,
    InvalidOutputBase,
    InvalidDigit,
};

fn to_int(digits: []const u32, base: u32) ConversionError!usize {
    var int: usize = 0;
    for (digits) |digit| {
        if (digit >= base) return ConversionError.InvalidDigit;
        int = int * base + digit;
    }
    return int;
}

fn to_base(allocator: mem.Allocator, int: usize, base: u32) mem.Allocator.Error![]u32 {
    var digits = std.ArrayList(u32).init(allocator);
    var ii = int;
    while (ii > 0) : (ii /= base) try digits.insert(0, @intCast(ii % base));

    if (digits.items.len == 0) try digits.append(0);
    return digits.toOwnedSlice();
}

/// Converts `digits` from `input_base` to `output_base`, returning a slice of digits.
/// Caller owns the returned memory.
pub fn convert(
    allocator: mem.Allocator,
    digits: []const u32,
    input_base: u32,
    output_base: u32,
) (mem.Allocator.Error || ConversionError)![]u32 {
    if (input_base < 2) return ConversionError.InvalidInputBase;
    if (output_base < 2) return ConversionError.InvalidOutputBase;

    const int = try to_int(digits, input_base);
    return try to_base(allocator, int, output_base);
}
