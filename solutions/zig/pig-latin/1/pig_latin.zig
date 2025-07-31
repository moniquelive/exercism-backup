const std = @import("std");
const mem = std.mem;

fn isVowel(c: u8) bool {
    return mem.indexOfScalar(u8, "aeiou", c) != null;
}

fn isConsonant(c: u8) bool {
    return mem.indexOfScalar(u8, "bcdfghjklmnpqrstvwxyz", c) != null;
}

fn isConsonantButY(c: u8) bool {
    return mem.indexOfScalar(u8, "bcdfghjklmnpqrstvwxz", c) != null;
}

fn oneOrMoreConsonant(word: []const u8) ?usize {
    var i: usize = 0;
    while (isConsonant(word[i])) : (i += 1) {}
    return if (i == 0) null else i;
}

fn oneOrMoreConsonantButY(word: []const u8) ?usize {
    var i: usize = 0;
    while (isConsonantButY(word[i]) and i < word.len) : (i += 1) {}
    return if (i == 0 or word[i] != 'y') null else i;
}

fn startsWith(word: []const u8, prefix: []const u8) bool {
    return mem.startsWith(u8, word, prefix);
}

fn rules(allocator: mem.Allocator, word: []const u8) mem.Allocator.Error![]u8 {
    if (isVowel(word[0]) or startsWith(word, "xr") or startsWith(word, "yt")) {
        return try std.fmt.allocPrint(allocator, "{s}ay", .{word});
    } else if (oneOrMoreConsonantButY(word)) |i| {
        return try std.fmt.allocPrint(allocator, "{s}{s}ay", .{ word[i..], word[0..i] });
    } else if (oneOrMoreConsonant(word)) |i| {
        if (startsWith(word[(i - 1)..], "qu")) {
            return try std.fmt.allocPrint(allocator, "{s}{s}ay", .{ word[(i + 1)..], word[0..(i + 1)] });
        }
        return try std.fmt.allocPrint(allocator, "{s}{s}ay", .{ word[i..], word[0..i] });
    }
    return mem.Allocator.Error.OutOfMemory;
}

pub fn translate(allocator: mem.Allocator, phrase: []const u8) mem.Allocator.Error![]u8 {
    var retval = std.ArrayList([]u8).init(allocator);
    defer {
        for (retval.items) |item| allocator.free(item);
        retval.deinit();
    }
    var it = mem.splitScalar(u8, phrase, ' ');
    while (it.next()) |word| try retval.append(try rules(allocator, word));
    return mem.join(allocator, " ", retval.items);
}
