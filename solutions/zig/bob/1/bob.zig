const std = @import("std");

fn question(input: []const u8) bool {
    return std.mem.endsWith(u8, input, "?");
}

fn shout(input: []const u8) bool {
    for (input) |c| {
        if (std.ascii.isAlphabetic(c) and std.ascii.isLower(c))
            return false;
    }

    const upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return std.mem.indexOfAny(u8, input, upperCaseLetters) != null;
}

pub fn response(s: []const u8) []const u8 {
    const trimmed = std.mem.trim(u8, s, &std.ascii.whitespace);

    if (trimmed.len == 0) return "Fine. Be that way!";
    if (question(trimmed) and shout(trimmed)) return "Calm down, I know what I'm doing!";
    if (question(trimmed)) return "Sure.";
    if (shout(trimmed)) return "Whoa, chill out!";
    return "Whatever.";
}
