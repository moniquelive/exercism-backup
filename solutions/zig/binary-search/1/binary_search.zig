pub fn binarySearch(comptime T: type, target: T, items: []const T) ?usize {
    return bin(T, target, items, 0, @intCast(items.len));
}

fn bin(comptime T: type, target: T, items: []const T, from: i64, to: i64) ?usize {
    if (to < from) return null;

    const avg = @divFloor(to + from, 2);
    if (avg < 0 or avg >= items.len) return null;

    const i: usize = @intCast(avg);
    const value = items[i];

    if (target == value) return i;
    if (target > value) return bin(T, target, items, avg + 1, to);
    if (target < value) return bin(T, target, items, from, avg - 1);
    unreachable;
}
