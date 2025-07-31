const std = @import("std");
const mem = std.mem;

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    const result = try allocator.alloc(u8, dna.len);
    for (dna, result) |n, *r| {
        r.* = switch (n) {
            'A' => 'U',
            'C' => 'G',
            'G' => 'C',
            'T' => 'A',
            else => return error.OutOfMemory,
        };
    }
    return result;
}
