const std = @import("std");
const mem = std.mem;

/// Encodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn encode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    var arr = std.ArrayList(u8).init(allocator);
    var spc: usize = 0;
    for (s) |ch| {
        if (ch >= 'a' and ch <= 'z') {
            try arr.append('z' - (ch - 'a'));
            spc += 1;
        } else if (ch >= 'A' and ch <= 'Z') {
            try arr.append('z' - (ch - 'A'));
            spc += 1;
        } else if (ch >= '0' and ch <= '9') {
            try arr.append(ch);
            spc += 1;
        }
        if (spc == 5) {
            try arr.append(' ');
            spc = 0;
        }
    }
    while (arr.getLast() == ' ') {
        _ = arr.pop();
    }
    return arr.toOwnedSlice();
}

/// Decodes `s` using the Atbash cipher. Caller owns the returned memory.
pub fn decode(allocator: mem.Allocator, s: []const u8) mem.Allocator.Error![]u8 {
    var arr = std.ArrayList(u8).init(allocator);
    for (s) |ch| {
        if (ch >= 'a' and ch <= 'z') {
            try arr.append('z' - (ch - 'a'));
        } else if (ch >= 'A' and ch <= 'Z') {
            try arr.append('z' - (ch - 'A'));
        } else if (ch >= '0' and ch <= '9') {
            try arr.append(ch);
        }
    }
    return arr.toOwnedSlice();
}
