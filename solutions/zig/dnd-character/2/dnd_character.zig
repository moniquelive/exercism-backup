const std = @import("std");

pub fn modifier(score: i8) i8 {
    return @divFloor(score - 10, 2);
}

pub fn ability() i8 {
    const rand = std.crypto.random;
    var dice = [4]i8{
        rand.intRangeAtMost(i8, 1, 6),
        rand.intRangeAtMost(i8, 1, 6),
        rand.intRangeAtMost(i8, 1, 6),
        rand.intRangeAtMost(i8, 1, 6),
    };
    std.mem.sort(i8, &dice, {}, std.sort.desc(i8));
    return dice[0] + dice[1] + dice[2];
}

pub const Character = struct {
    strength: i8,
    dexterity: i8,
    constitution: i8,
    intelligence: i8,
    wisdom: i8,
    charisma: i8,
    hitpoints: i8,

    pub fn init() Character {
        const c = ability();
        return Character{
            .strength = ability(),
            .dexterity = ability(),
            .constitution = c,
            .intelligence = ability(),
            .wisdom = ability(),
            .charisma = ability(),
            .hitpoints = 10 + modifier(c),
        };
    }
};
