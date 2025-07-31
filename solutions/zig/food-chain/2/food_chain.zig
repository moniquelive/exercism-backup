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
    .{ .animal = .fly, .that = "I don't know why she swallowed the fly. Perhaps she'll die." },
};

pub fn recite(buffer: []u8, start_verse: u32, end_verse: u32) []const u8 {
    var s = std.io.fixedBufferStream(buffer);
    for (start_verse - 1..end_verse) |i| {
        if (s.pos > 0) s.writer().writeAll("\n") catch unreachable;

        // intro
        const swallowed = verses[verses.len - i - 1];
        s.writer().print("I know an old lady who swallowed a {s}.\n", .{@tagName(swallowed.animal)}) catch unreachable;
        s.writer().writeAll(swallowed.that) catch unreachable;
        if (i == verses.len - 1) break;

        // swallowed
        for (verses.len - i..verses.len) |j| {
            const from = verses[j - 1];
            const to = verses[j];
            s.writer().print("She swallowed the {s} to catch the {s}", .{ @tagName(from.animal), @tagName(to.animal) }) catch unreachable;
            switch (to.animal) {
                .spider => s.writer().writeAll(" that wriggled and jiggled and tickled inside her.\n") catch unreachable,
                .fly => s.writer().print(".\n{s}", .{to.that}) catch unreachable,
                else => s.writer().writeAll(".\n") catch unreachable,
            }
        }
        if (i < end_verse - 1) s.writer().writeAll("\n") catch unreachable;
    }
    return s.getWritten();
}
