const std = @import("std");
const EnumSet = std.EnumSet;

pub const Allergen = enum {
    eggs,
    peanuts,
    shellfish,
    strawberries,
    tomatoes,
    chocolate,
    pollen,
    cats,
};

pub fn isAllergicTo(score: u8, allergen: Allergen) bool {
    switch (allergen) {
        .eggs => return score & 1 > 0,
        .peanuts => return score & 2 > 0,
        .shellfish => return score & 4 > 0,
        .strawberries => return score & 8 > 0,
        .tomatoes => return score & 16 > 0,
        .chocolate => return score & 32 > 0,
        .pollen => return score & 64 > 0,
        .cats => return score & 128 > 0,
    }
}

pub fn initAllergenSet(score: usize) EnumSet(Allergen) {
    return EnumSet(Allergen).init(.{
        .eggs = score & 1 > 0,
        .peanuts = score & 2 > 0,
        .shellfish = score & 4 > 0,
        .strawberries = score & 8 > 0,
        .tomatoes = score & 16 > 0,
        .chocolate = score & 32 > 0,
        .pollen = score & 64 > 0,
        .cats = score & 128 > 0,
    });
}
