pub fn isValidIsbn10(s: []const u8) bool {
    var w: usize = 10;
    var total: usize = 0;
    for (s) |ch| {
        if (w == 0 or w > 1 and ch == 'X') return false;
        if (ch == '-') continue;

        total += w * if (ch == 'X') 10 else ch - '0';
        w -= 1;
    }
    return w == 0 and total % 11 == 0;
}
