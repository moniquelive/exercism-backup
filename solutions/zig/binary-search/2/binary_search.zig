pub fn binarySearch(comptime T: type, target: T, items: []const T) ?usize {
    if (items.len == 0) return null;

    var l: usize = 0;
    var h: usize = items.len;
    var m: usize = l + (h - l) / 2;

    while (items[m] != target) : (m = l + (h - l) / 2) {
        if (h - l <= 1) return null;
        if (target > items[m]) {
            l = m;
        } else {
            h = m;
        }
    }
    return m;
}
