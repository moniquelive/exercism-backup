const std = @import("std");
const fmt = std.fmt;
const mem = std.mem;

const verse = "For want of a {s} the {s} was lost.\n";
const ending = "And all for the want of a {s}.\n";

pub fn recite(allocator: mem.Allocator, words: []const []const u8) (fmt.AllocPrintError || mem.Allocator.Error)![][]u8 {
    var result = try allocator.alloc([]u8, words.len);

    var i: usize = 1;
    while (i < words.len) : (i += 1) {
        result[i - 1] = try fmt.allocPrint(allocator, verse, .{ words[i - 1], words[i] });
    }
    if (words.len > 0)
        result[i - 1] = try fmt.allocPrint(allocator, ending, .{words[0]});

    return result;
}
