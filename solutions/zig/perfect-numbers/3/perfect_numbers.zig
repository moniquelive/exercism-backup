pub const Classification = enum {
    deficient,
    perfect,
    abundant,
};

/// Asserts that `n` is nonzero.
pub fn classify(n: u64) Classification {
    var a: usize = 0;
    for (1..n) |f| {
        if (f > n / 2) break;
        if (n % f == 0) a += f;
    }

    if (a < n) return .deficient;
    if (a > n) return .abundant;
    return .perfect;
}
