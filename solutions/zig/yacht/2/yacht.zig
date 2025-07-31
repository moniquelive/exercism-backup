const std = @import("std");
const mem = std.mem;

pub const Category = enum(u4) {
    ones = 1,
    twos,
    threes,
    fours,
    fives,
    sixes,
    full_house,
    four_of_a_kind,
    little_straight,
    big_straight,
    choice,
    yacht,
};

fn count(d: [5]u3, n: u3) u32 {
    const needle = [_]u3{n};
    return @intCast(mem.count(u3, &d, &needle));
}

fn fullHouse(d: [5]u3) bool {
    const f = d[0] == d[1] and d[1] != d[2] and d[2] == d[4]; // AABBB
    const s = d[0] == d[2] and d[2] != d[3] and d[3] == d[4]; // AAABB
    return f or s;
}

fn sum(d: [5]u3) u32 {
    return @as(u32, d[0]) + d[1] + d[2] + d[3] + d[4];
}

pub fn score(dice: [5]u3, category: Category) u32 {
    var sorted: [5]u3 = undefined;
    @memcpy(&sorted, &dice);
    mem.sort(u3, &sorted, {}, comptime std.sort.asc(u3));

    return switch (category) {
        .ones, .twos, .threes, .fours, .fives, .sixes => |c| @intFromEnum(c) * count(sorted, @intCast(@intFromEnum(c))),
        .full_house => if (fullHouse(sorted)) sum(sorted) else 0,
        .four_of_a_kind => if (sorted[0] == sorted[3] or sorted[1] == sorted[4]) @as(u32, 4) * sorted[1] else 0,
        .little_straight => if (mem.eql(u3, &sorted, &.{ 1, 2, 3, 4, 5 })) 30 else 0,
        .big_straight => if (mem.eql(u3, &sorted, &.{ 2, 3, 4, 5, 6 })) 30 else 0,
        .choice => sum(sorted),
        .yacht => if (sorted[0] == sorted[4]) 50 else 0,
    };
}
