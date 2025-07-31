pub const Classification = enum {
    deficient,
    perfect,
    abundant,
};

fn aliquot_sum(n: u64) u64 {
    var sum: usize = 0;
    if (n > 1) for (1..n - 1) |f| {
        if (n % f == 0) sum += f;
    };
    return sum;
}

/// Asserts that `n` is nonzero.
pub fn classify(n: u64) Classification {
    const a = aliquot_sum(n);
    if (a < n) return .deficient;
    if (a > n) return .abundant;
    return .perfect;
}
