const std = @import("std");
const fmt = std.fmt;
const mem = std.mem;

const verse = "For want of a {s} the {s} was lost.\n";
const ending = "And all for the want of a {s}.\n";

pub fn recite(allocator: mem.Allocator, words: []const []const u8) (fmt.AllocPrintError || mem.Allocator.Error)![][]u8 {
    var arr = std.ArrayList([]u8).init(allocator);

    if (words.len > 0) {
        if (words.len > 1) {
            var it = mem.window([]const u8, words[0..], 2, 1);
            while (it.next()) |w|
                try arr.append(try fmt.allocPrint(allocator, verse, .{ w[0], w[1] }));
        }
        try arr.append(try fmt.allocPrint(allocator, ending, .{words[0]}));
    }

    return arr.toOwnedSlice();
}
