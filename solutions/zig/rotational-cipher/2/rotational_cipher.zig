const mem = @import("std").mem;

fn rotate_u8(base: u8, ch: u8, off: u5) u8 {
    return base + ((ch - base + off) % 26);
}

pub fn rotate(allocator: mem.Allocator, text: []const u8, shiftKey: u5) mem.Allocator.Error![]u8 {
    const retval: []u8 = try allocator.alloc(u8, text.len);
    for (text, retval) |ch, *p| {
        p.* = switch (ch) {
            'a'...'z' => rotate_u8('a', ch, shiftKey),
            'A'...'Z' => rotate_u8('A', ch, shiftKey),
            else => ch,
        };
    }
    return retval;
}
