#!/usr/bin/env ruby

class Prime
  def self.nth(n)
    raise ArgumentError if n < 1
    @prime[n]
  end

  # http://en.wikipedia.org/wiki/Sieve_of_Sundaram
  def self.calc_primes(limit)
    n = limit/2
    prime = Array.new(limit)

    (1...n).each do |i|
      (i..((n - i) / (2 * i + 1))).each do |j|
        prime[i + j + 2 * i * j] = true
      end
    end

    @prime = [nil]
    @prime += prime.map.with_index { |n, i| 2*i+1 unless n}.compact
    @prime[1] = 2
  end
end

Prime.calc_primes(200_000)