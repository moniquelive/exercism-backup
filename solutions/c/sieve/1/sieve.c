#include "sieve.h"
#include <stdbool.h>
#include <string.h>
#include <stdio.h>

uint32_t sieve(uint32_t limit, uint32_t *primes, size_t max_primes) {
    bool sieve[max_primes + 1];
    memset(sieve, true, sizeof(sieve));
    for (uint32_t p=2; p*p <= max_primes; p++) {
        if (sieve[p])
            for (uint32_t i = p*p; i <= limit; i+=p)
                sieve[i] = false;
    }
    uint32_t count = 0;
    for (uint32_t i = 2; i <= limit; i++)
        if (sieve[i])
            primes[count++] = i;
    return count;
}