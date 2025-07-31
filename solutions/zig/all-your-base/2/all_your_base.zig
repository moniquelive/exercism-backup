const std = @import("std");
const mem = std.mem;

pub const ConversionError = error{
    InvalidInputBase,
    InvalidOutputBase,
    InvalidDigit,
};

pub fn convert(allocator: mem.Allocator, digits: []const u32, input_base: u32, output_base: u32) (mem.Allocator.Error || ConversionError)![]u32 {
    if (input_base < 2) return ConversionError.InvalidInputBase;
    if (output_base < 2) return ConversionError.InvalidOutputBase;

    var int: usize = 0;
    for (digits) |digit| {
        if (digit >= input_base)
            return ConversionError.InvalidDigit;

        int = int * input_base + digit;
    }

    var conv = std.ArrayList(u32).init(allocator);
    while (int > 0) : (int /= output_base)
        try conv.insert(0, @intCast(int % output_base));

    if (conv.items.len == 0)
        try conv.append(0);
    return conv.toOwnedSlice();
}
