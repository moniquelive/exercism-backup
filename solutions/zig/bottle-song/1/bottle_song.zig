const std = @import("std");

const numbers: [10][]const u8 = .{ "Ten", "Nine", "Eight", "Seven", "Six", "Five", "Four", "Three", "Two", "One" };
const lNumbers: [10][]const u8 = .{ "ten", "nine", "eight", "seven", "six", "five", "four", "three", "two", "one" };

pub fn recite(buffer: []u8, start_bottles: u32, take_down: u32) []const u8 {
    var s = std.io.fixedBufferStream(buffer);
    const start = 10 - start_bottles;
    for (start..start + take_down) |i| {
        if (s.pos > 0) s.writer().writeAll("\n\n") catch unreachable;
        if (i == numbers.len - 1) {
            s.writer().print("{s} green bottle hanging on the wall,\n", .{numbers[i]}) catch unreachable;
            s.writer().print("{s} green bottle hanging on the wall,\n", .{numbers[i]}) catch unreachable;
            s.writer().writeAll("And if one green bottle should accidentally fall,\n") catch unreachable;
            s.writer().writeAll("There'll be no green bottles hanging on the wall.") catch unreachable;
            continue;
        }
        s.writer().print("{s} green bottles hanging on the wall,\n", .{numbers[i]}) catch unreachable;
        s.writer().print("{s} green bottles hanging on the wall,\n", .{numbers[i]}) catch unreachable;
        s.writer().writeAll("And if one green bottle should accidentally fall,\n") catch unreachable;
        const plural = if (i + 1 < numbers.len - 1) "s" else "";
        s.writer().print("There'll be {s} green bottle{s} hanging on the wall.", .{ lNumbers[i + 1], plural }) catch unreachable;
    }
    return s.getWritten();
}
