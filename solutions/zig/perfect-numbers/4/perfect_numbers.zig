pub const Classification = enum {
    deficient,
    perfect,
    abundant,
};

/// Asserts that `n` is nonzero.
pub fn classify(n: u64) Classification {
    var a: usize = 0;
    for (1..(n / 2) + 1) |f| {
        if (n % f == 0) a += f;
    }

    if (a < n) return .deficient;
    if (a > n) return .abundant;
    return .perfect;
}
