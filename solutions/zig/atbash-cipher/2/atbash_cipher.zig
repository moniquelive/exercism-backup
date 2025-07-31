const std = @import("std");
const ascii = std.ascii;
const mem = std.mem;

/// Encodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn encode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    var arr = std.ArrayList(u8).init(allocator);
    for (s) |ch| {
        if (ascii.isAlphanumeric(ch)) {
            const c = if (ascii.isDigit(ch)) ch else 'z' - (ascii.toLower(ch) - 'a');
            try arr.append(c);
        }
        if (arr.items.len % 6 == 5) { // we're on the 5th char in a group of 6: 'abcde '
            try arr.append(' ');
        }
    }
    if (arr.getLast() == ' ') _ = arr.pop();
    return arr.toOwnedSlice();
}

/// Decodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn decode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    var arr = std.ArrayList(u8).init(allocator);
    for (s) |ch| {
        if (ascii.isAlphanumeric(ch)) {
            const c = if (ascii.isDigit(ch)) ch else 'z' - (ascii.toLower(ch) - 'a');
            try arr.append(c);
        }
    }
    return arr.toOwnedSlice();
}
