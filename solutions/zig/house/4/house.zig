const std = @import("std");

const Verse = struct {
    that: []const u8,
    the: []const u8,
};

const verses: [12]Verse = .{
    .{ .that = "", .the = "horse and the hound and the horn" },
    .{ .that = "belonged to", .the = "farmer sowing his corn" },
    .{ .that = "kept", .the = "rooster that crowed in the morn" },
    .{ .that = "woke", .the = "priest all shaven and shorn" },
    .{ .that = "married", .the = "man all tattered and torn" },
    .{ .that = "kissed", .the = "maiden all forlorn" },
    .{ .that = "milked", .the = "cow with the crumpled horn" },
    .{ .that = "tossed", .the = "dog" },
    .{ .that = "worried", .the = "cat" },
    .{ .that = "killed", .the = "rat" },
    .{ .that = "ate", .the = "malt" },
    .{ .that = "lay in", .the = "house that Jack built." },
};

pub fn recite(buffer: []u8, start_verse: u32, end_verse: u32) []const u8 {
    var s = std.io.fixedBufferStream(buffer);
    for (start_verse - 1..end_verse) |i| {
        s.writer().print("This is the {s}", .{verses[verses.len - i - 1].the}) catch unreachable;
        for (verses[verses.len - i .. verses.len]) |verse|
            s.writer().print(" that {s} the {s}", .{ verse.that, verse.the }) catch unreachable;
        if (i < end_verse - 1) s.writer().print("\n", .{}) catch unreachable;
    }
    return s.getWritten();
}
