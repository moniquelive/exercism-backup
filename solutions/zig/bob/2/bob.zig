const std = @import("std");
const ascii = std.ascii;
const mem = std.mem;

fn question(input: []const u8) bool {
    return input[input.len - 1] == '?';
}

fn shout(input: []const u8) bool {
    var containsUpper = false;
    for (input) |c| {
        if (ascii.isUpper(c)) containsUpper = true;
        if (ascii.isAlphabetic(c) and ascii.isLower(c)) return false;
    }
    return containsUpper;
}

pub fn response(s: []const u8) []const u8 {
    const t = mem.trim(u8, s, &ascii.whitespace);

    if (t.len == 0) return "Fine. Be that way!";
    if (question(t) and shout(t)) return "Calm down, I know what I'm doing!";
    if (question(t)) return "Sure.";
    if (shout(t)) return "Whoa, chill out!";
    return "Whatever.";
}
