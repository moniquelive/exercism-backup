pub const NucleotideError = error{Invalid};

pub const Counts = struct { a: u32, c: u32, g: u32, t: u32 };

pub fn countNucleotides(s: []const u8) NucleotideError!Counts {
    var c: Counts = .{ .a = 0, .c = 0, .g = 0, .t = 0 };
    for (s) |n| switch (n) {
        'A' => c.a += 1,
        'C' => c.c += 1,
        'G' => c.g += 1,
        'T' => c.t += 1,
        else => return NucleotideError.Invalid,
    };
    return c;
}
