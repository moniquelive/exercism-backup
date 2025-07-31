const std = @import("std");

const Animal = enum { fly, spider, bird, cat, dog, goat, cow, horse };

const Verse = struct {
    animal: Animal,
    that: []const u8,
};

const verses: [8]Verse = .{
    .{ .animal = .horse, .that = "She's dead, of course!" },
    .{ .animal = .cow, .that = "I don't know how she swallowed a cow!\n" },
    .{ .animal = .goat, .that = "Just opened her throat and swallowed a goat!\n" },
    .{ .animal = .dog, .that = "What a hog, to swallow a dog!\n" },
    .{ .animal = .cat, .that = "Imagine that, to swallow a cat!\n" },
    .{ .animal = .bird, .that = "How absurd to swallow a bird!\n" },
    .{ .animal = .spider, .that = "It wriggled and jiggled and tickled inside her.\n" },
    .{ .animal = .fly, .that = "" },
};

inline fn spiderCompl(animal: Animal) []const u8 {
    return switch (animal) {
        .spider => " that wriggled and jiggled and tickled inside her",
        else => "",
    };
}

inline fn flyCompl(animal: Animal) []const u8 {
    return switch (animal) {
        .fly => "I don't know why she swallowed the fly. Perhaps she'll die.",
        else => "",
    };
}

pub fn recite(buffer: []u8, start_verse: u32, end_verse: u32) []const u8 {
    var s = std.io.fixedBufferStream(buffer);
    for (start_verse - 1..end_verse) |i| {
        if (s.pos > 0) s.writer().writeAll("\n") catch unreachable;

        // intro
        const swallowed = verses[verses.len - i - 1];
        s.writer().print("I know an old lady who swallowed a {s}.\n", .{@tagName(swallowed.animal)}) catch unreachable;
        s.writer().writeAll(swallowed.that) catch unreachable;
        s.writer().writeAll(flyCompl(swallowed.animal)) catch unreachable;
        if (i == 7) break;

        // swalloed
        for (verses.len - i..verses.len) |j| {
            const from = verses[j - 1];
            const to = verses[j];
            s.writer().print("She swallowed the {s} to catch the {s}{s}.\n", .{ @tagName(from.animal), @tagName(to.animal), spiderCompl(to.animal) }) catch unreachable;
            s.writer().writeAll(flyCompl(to.animal)) catch unreachable;
        }
        if (i < end_verse - 1) s.writer().writeAll("\n") catch unreachable;
    }
    return s.getWritten();
}
