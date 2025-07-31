const std = @import("std");
const rand = std.crypto.random;

pub fn modifier(score: i8) i8 {
    return @divFloor(score - 10, 2);
}

pub fn ability() i8 {
    return rand.intRangeAtMost(i8, 3, 18);
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
        var c = Character{
            .strength = ability(),
            .dexterity = ability(),
            .constitution = ability(),
            .intelligence = ability(),
            .wisdom = ability(),
            .charisma = ability(),
            .hitpoints = 0,
        };
        c.hitpoints = 10 + modifier(c.constitution);
        return c;
    }
};
