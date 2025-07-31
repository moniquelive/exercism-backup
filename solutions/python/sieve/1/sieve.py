from itertools import takewhile


def primes(limit):
    sieve = {k: True for k in range(2, 1003)}
    for i, p in sieve.items():
        if p:
            for j in range(i * i, len(sieve), i):
                sieve[j] = False
    primes = list(filter(lambda k: sieve[k], sieve))
    return list(takewhile(lambda n: n <= limit, primes))
