const std = @import("std");

pub const Plant = enum { clover, grass, radishes, violets };

inline fn plant(ch: u8) Plant {
    return switch (ch) {
        'G' => .grass,
        'C' => .clover,
        'R' => .radishes,
        'V' => .violets,
        else => unreachable,
    };
}

pub fn plants(diagram: []const u8, student: []const u8) [4]Plant {
    var result: [4]Plant = undefined;
    const index = 2 * (student[0] - 'A');

    var off: usize = 0;
    var it = std.mem.splitScalar(u8, diagram, '\n');
    while (it.next()) |line| {
        result[off] = plant(line[index]);
        result[off + 1] = plant(line[index + 1]);
        off += 2;
    }
    return result;
}
