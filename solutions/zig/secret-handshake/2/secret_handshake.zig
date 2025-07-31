const std = @import("std");
const mem = std.mem;

pub const Signal = enum { wink, double_blink, close_your_eyes, jump };

pub fn calculateHandshake(allocator: mem.Allocator, number: u5) mem.Allocator.Error![]const Signal {
    var result = std.ArrayList(Signal).init(allocator);
    defer result.deinit();
    if (number & 0b00001 > 0) try result.append(.wink);
    if (number & 0b00010 > 0) try result.append(.double_blink);
    if (number & 0b00100 > 0) try result.append(.close_your_eyes);
    if (number & 0b01000 > 0) try result.append(.jump);
    if (number & 0b10000 > 0) mem.reverse(Signal, result.items);
    return result.toOwnedSlice();
}
