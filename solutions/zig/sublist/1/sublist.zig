const std = @import("std");

pub const Relation = enum { equal, sublist, superlist, unequal };

const T = i32;

pub fn compare(list_one: []const T, list_two: []const T) Relation {
    if (std.mem.eql(T, list_one, list_two)) return .equal;
    if (contains(list_one, list_two)) return .superlist;
    if (contains(list_two, list_one)) return .sublist;
    return .unequal;
}

fn contains(list_one: []const T, list_two: []const T) bool {
    if (list_one.len == 0) return false;

    return std.mem.startsWith(T, list_one, list_two) or contains(list_one[1..], list_two);
}
