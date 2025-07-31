const std = @import("std");
const mem = std.mem;

pub fn isBalanced(allocator: mem.Allocator, s: []const u8) !bool {
    var stack = std.ArrayList(u8).init(allocator);
    defer stack.deinit();

    for (s) |ch| {
        switch (ch) {
            '(' => try stack.append(')'),
            '[' => try stack.append(']'),
            '{' => try stack.append('}'),
            ')' => if (stack.items.len == 0 or stack.items[stack.items.len - 1] != ')') {
                return false;
            } else {
                _ = stack.pop();
            },
            ']' => if (stack.items.len == 0 or stack.items[stack.items.len - 1] != ']') {
                return false;
            } else {
                _ = stack.pop();
            },
            '}' => if (stack.items.len == 0 or stack.items[stack.items.len - 1] != '}') {
                return false;
            } else {
                _ = stack.pop();
            },
            else => {},
        }
    }
    return stack.items.len == 0;
}
