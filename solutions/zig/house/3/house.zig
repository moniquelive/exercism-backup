const std = @import("std");

const Verse = struct {
    action: []const u8,
    title: []const u8,
};

const verses: [12]Verse = .{
    .{ .action = "", .title = "the horse and the hound and the horn" },
    .{ .action = "that belonged to", .title = "the farmer sowing his corn" },
    .{ .action = "that kept", .title = "the rooster that crowed in the morn" },
    .{ .action = "that woke", .title = "the priest all shaven and shorn" },
    .{ .action = "that married", .title = "the man all tattered and torn" },
    .{ .action = "that kissed", .title = "the maiden all forlorn" },
    .{ .action = "that milked", .title = "the cow with the crumpled horn" },
    .{ .action = "that tossed", .title = "the dog" },
    .{ .action = "that worried", .title = "the cat" },
    .{ .action = "that killed", .title = "the rat" },
    .{ .action = "that ate", .title = "the malt" },
    .{ .action = "that lay in", .title = "the house that Jack built." },
};

pub fn recite(buffer: []u8, start_verse: u32, end_verse: u32) []const u8 {
    var s = std.io.fixedBufferStream(buffer);
    const w = s.writer();
    for (start_verse - 1..end_verse) |i| {
        w.print("This is {s}", .{verses[verses.len - i - 1].title}) catch unreachable;
        for (verses[verses.len - i .. verses.len]) |v|
            w.print(" {s} {s}", .{ v.action, v.title }) catch unreachable;
        if (i < end_verse - 1) w.print("\n", .{}) catch unreachable;
    }
    return s.getWritten();
}
