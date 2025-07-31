const std = @import("std");
const mem = std.mem;

fn isPrime(k: usize) bool {
    if (k <= 1) return false;
    if (k == 2 or k == 3) return true;
    if (k % 2 == 0 or k % 3 == 0) return false;
    var i: usize = 5;
    const until = 1 + std.math.sqrt(k);
    while (i < until) : (i += 6)
        if (k % i == 0 or k % (i + 2) == 0)
            return false;
    return true;
}

pub fn prime(_: mem.Allocator, number: usize) !usize {
    var i: usize = 2;
    var n = number;
    while (n > 0) : (i += 1) {
        if (isPrime(i)) n -= 1;
    }
    return i - 1;
}
