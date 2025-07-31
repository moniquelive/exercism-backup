pub fn LinkedList(comptime T: type) type {
    return struct {
        pub const Node = struct {
            prev: ?*Node = null,
            next: ?*Node = null,
            data: T,
        };

        first: ?*Node = null,
        last: ?*Node = null,
        len: usize = 0,

        const Self = @This();

        pub fn push(self: *Self, node: *Node) void {
            defer self.len += 1;
            if (self.len == 0) self.first = node else self.last.?.next = node;
            node.prev = self.last;
            self.last = node;
        }

        pub fn pop(self: *Self) ?*Node {
            defer self.len -= 1;
            const last = self.last;
            self.last = last.?.prev;
            if (self.last) |l| l.next = null;
            return last;
        }

        pub fn shift(self: *Self) ?*Node {
            defer self.len -= 1;
            const first = self.first;
            self.first = first.?.next;
            if (self.first) |f| f.prev = null;
            return first;
        }

        pub fn unshift(self: *Self, node: *Node) void {
            defer self.len += 1;
            node.next = self.first;
            if (node.next) |n| n.prev = node;
            self.first = node;
        }

        pub fn delete(self: *Self, node: *Node) void {
            var current = self.first;
            while (current) |cur| : (current = cur.next) {
                if (cur != node) continue;
                if (cur.prev) |prev| prev.next = cur.next else self.first = cur.next;
                if (cur.next) |next| next.prev = cur.prev else self.last = cur.prev;
                cur.prev = null;
                cur.next = null;
                self.len -= 1;
                return;
            }
        }
    };
}
