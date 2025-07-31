const std = @import("std");
const mem = std.mem;

pub const Category = enum {
    ones,
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

fn fullHouse(dice: [5]u3) bool {
    const f = dice[0] == dice[1] and dice[1] != dice[2] and dice[2] == dice[4];
    const s = dice[0] == dice[2] and dice[2] != dice[3] and dice[3] == dice[4];
    return f or s;
}

fn sum4(dice: [5]u3) u32 {
    const v: @Vector(5, u32) = dice;
    if (dice[0] == dice[1])
        return v[0] + v[1] + v[2] + v[3];
    return v[1] + v[2] + v[3] + v[4];
}

fn count(dice: [5]u3, n: u3) u32 {
    const needle = [_]u3{n};
    return @intCast(mem.count(u3, &dice, &needle));
}

pub fn score(dice: [5]u3, category: Category) u32 {
    const v: @Vector(5, u32) = dice;
    var d = dice;
    mem.sort(u3, &d, {}, comptime std.sort.asc(u3));
    return switch (category) {
        .ones => 1 * count(d, 1),
        .twos => 2 * count(d, 2),
        .threes => 3 * count(d, 3),
        .fours => 4 * count(d, 4),
        .fives => 5 * count(d, 5),
        .sixes => 6 * count(d, 6),
        .full_house => if (fullHouse(d)) @reduce(.Add, v) else 0,
        .four_of_a_kind => if (dice[0] == dice[3] or dice[1] == dice[4]) sum4(d) else 0,
        .little_straight => if (mem.eql(u3, &d, &.{ 1, 2, 3, 4, 5 })) 30 else 0,
        .big_straight => if (mem.eql(u3, &d, &.{ 2, 3, 4, 5, 6 })) 30 else 0,
        .choice => @reduce(.Add, v),
        .yacht => if (dice[0] == dice[4]) 50 else 0,
    };
}
