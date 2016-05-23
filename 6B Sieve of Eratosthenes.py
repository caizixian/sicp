#!/usr/bin/env python3

def sieve(generator):
    a = next(generator)
    yield a
    yield from sieve(filter(lambda x: (x%a) != 0,generator))

def primes(n):
    return sieve(iter(range(2, n)))

print(list(primes(1000))) 