const std = @import("std");

pub fn primes(buffer: []u32, limit: u32) []u32 {
    if (limit < 2) return buffer[0..0];
    var sieve = [_]bool{true} ** 1024;
    const max = @min(limit, 1023);
    var count: usize = 0;
    var i: u32 = 2;
    while (i <= max and count < buffer.len) : (i += 1) {
        if (sieve[i]) {
            buffer[count] = i;
            count += 1;
            var j = i * i;
            while (j <= max) : (j += i) sieve[j] = false;
        }
    }
    return buffer[0..count];
}