const std = @import("std");

pub fn encode(buffer: []u8, string: []const u8) []u8 {
    if (string.len == 0) return "";

    var fba = std.heap.FixedBufferAllocator.init(buffer);
    const allocator = fba.allocator();
    var arr = std.ArrayList(u8).init(allocator);
    defer arr.deinit();

    const stream = arr.writer();

    var count: usize = 1;
    var curr_char = string[0];
    for (1..string.len) |i| {
        const next_char = string[i];
        if (next_char == curr_char) {
            count += 1;
        } else {
            if (count > 1) {
                stream.print("{d}{c}", .{ count, curr_char }) catch {};
            } else {
                stream.print("{c}", .{curr_char}) catch {};
            }
            count = 1;
            curr_char = next_char;
        }
    }
    if (count > 1) {
        stream.print("{d}{c}", .{ count, curr_char }) catch {};
    } else {
        stream.print("{c}", .{curr_char}) catch {};
    }
    return arr.toOwnedSlice() catch unreachable;
}

pub fn decode(buffer: []u8, string: []const u8) []u8 {
    if (string.len == 0) return "";

    var fba = std.heap.FixedBufferAllocator.init(buffer);
    const allocator = fba.allocator();
    var arr = std.ArrayList(u8).init(allocator);
    defer arr.deinit();

    const stream = arr.writer();

    var start: usize = 0;
    var end: usize = 1;
    var in_digit = false;
    for (0..string.len) |i| {
        if (in_digit) {
            if (std.ascii.isDigit(string[i])) {
                end += 1;
            } else {
                end = i;
                const count = std.fmt.parseInt(usize, string[start..end], 10) catch unreachable;
                for (0..count) |_| {
                    stream.print("{c}", .{string[i]}) catch {};
                }
                in_digit = false;
            }
        } else {
            if (std.ascii.isDigit(string[i])) {
                start = i;
                in_digit = true;
            } else {
                stream.print("{c}", .{string[i]}) catch {};
            }
        }
    }
    return arr.toOwnedSlice() catch unreachable;
}
