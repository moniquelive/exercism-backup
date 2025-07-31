pub fn isValidIsbn10(s: []const u8) bool {
    var w: usize = 10;
    var total: usize = 0;
    const consider = for (s) |ch| {
        if (w == 0) break false;

        const d: usize = switch (ch) {
            '-' => continue,
            '0'...'9' => ch - '0',
            'X' => if (w == 1) 10 else break false,
            else => break false,
        };
        total += d * w;
        w -= 1;
    } else true;
    return consider and w == 0 and total % 11 == 0;
}
