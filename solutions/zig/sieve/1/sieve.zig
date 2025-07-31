const std = @import("std");

pub fn primes(buffer: []u32, limit: u32) []u32 {
    if (buffer.len == 0 or limit < 2) return buffer[0..0];

    var sieve = [_]bool{true} ** 1024;
    const max = @min(limit, 1023);
    
    sieve[0] = false;
    sieve[1] = false;

    var i: u32 = 2;
    while (i * i <= max) : (i += 1) {
        if (sieve[i]) {
            var j = i * i;
            while (j <= max) : (j += i) {
                sieve[j] = false;
            }
        }
    }

    var count: usize = 0;
    var n: u32 = 0;
    while (n <= max and count < buffer.len) : (n += 1) {
        if (sieve[n]) {
            buffer[count] = n;
            count += 1;
        }
    }

    return buffer[0..count];
}