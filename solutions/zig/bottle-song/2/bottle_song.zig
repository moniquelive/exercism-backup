const std = @import("std");

const numbers: [11][]const u8 = .{ "Ten", "Nine", "Eight", "Seven", "Six", "Five", "Four", "Three", "Two", "One", "No" };

pub fn recite(buffer: []u8, start_bottles: u32, take_down: u32) []const u8 {
    var s = std.io.fixedBufferStream(buffer);
    const start = 10 - start_bottles;
    for (start..start + take_down) |i| {
        if (s.pos > 0) s.writer().writeAll("\n\n") catch unreachable;
        const plural1 = if (i == numbers.len - 2) "" else "s";
        const plural2 = if (i + 1 == numbers.len - 2) "" else "s";
        const next = numbers[i + 1];
        const nextH = std.ascii.toLower(next[0]);
        const nextT = next[1..];
        s.writer().print(
            \\{s} green bottle{s} hanging on the wall,
            \\{s} green bottle{s} hanging on the wall,
            \\And if one green bottle should accidentally fall,
            \\There'll be {c}{s} green bottle{s} hanging on the wall.
        , .{ numbers[i], plural1, numbers[i], plural1, nextH, nextT, plural2 }) catch unreachable;
    }
    return s.getWritten();
}
