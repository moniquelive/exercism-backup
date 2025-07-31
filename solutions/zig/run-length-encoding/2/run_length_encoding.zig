const std = @import("std");
const io = std.io;
const ascii = std.ascii;

pub fn encode(buffer: []u8, string: []const u8) []u8 {
    if (string.len == 0) return "";

    var stream = io.fixedBufferStream(buffer);
    const writer = stream.writer();

    var count: usize = 1;
    for (string, 1..) |ch, n| {
        const next_char = if (n < string.len) string[n] else 0;
        if (next_char == ch) {
            count += 1;
        } else {
            if (count > 1) writer.print("{d}", .{count}) catch {};
            writer.writeByte(ch) catch {};
            count = 1;
        }
    }
    return stream.getWritten();
}

pub fn decode(buffer: []u8, string: []const u8) []u8 {
    var count: usize = 0;
    var idx: usize = 0;
    for (string) |c| {
        if (ascii.isDigit(c)) {
            count = count * 10 + (c - '0');
        } else {
            const delta = @max(count, 1);
            @memset(buffer[idx .. idx + delta], c);
            idx += delta;
            count = 0;
        }
    }
    return buffer[0..idx];
}
