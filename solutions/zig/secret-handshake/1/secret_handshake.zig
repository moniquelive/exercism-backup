const std = @import("std");
const mem = std.mem;

pub const Signal = enum(u5) {
    wink = 1,
    double_blink = 2,
    close_your_eyes = 4,
    jump = 8,
    reverse = 16,
};

pub fn calculateHandshake(allocator: mem.Allocator, number: u5) mem.Allocator.Error![]const Signal {
    var result = std.ArrayList(Signal).init(allocator);
    if (number & 1 == 1) try result.append(.wink);
    if (number & 2 == 2) try result.append(.double_blink);
    if (number & 4 == 4) try result.append(.close_your_eyes);
    if (number & 8 == 8) try result.append(.jump);
    if (number & 16 == 16) mem.reverse(Signal, result.items);
    return result.toOwnedSlice();
}
