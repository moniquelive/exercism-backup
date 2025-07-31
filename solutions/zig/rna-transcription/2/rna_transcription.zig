const mem = @import("std").mem;

pub fn toRna(allocator: mem.Allocator, dna: []const u8) mem.Allocator.Error![]const u8 {
    const rna = try allocator.alloc(u8, dna.len);
    for (dna, rna) |n, *r| {
        r.* = switch (n) {
            'A' => 'U',
            'C' => 'G',
            'G' => 'C',
            'T' => 'A',
            else => unreachable,
        };
    }
    return rna;
}
