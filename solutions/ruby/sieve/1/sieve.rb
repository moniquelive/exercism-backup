class Sieve
  def initialize(limit)
    @limit = limit
  end

  def primes
    @primes ||= doit
  end

  private

  def doit
    (2..@limit).to_a.tap do |sieve|
      sieve.size.times do |i|
        n = sieve[i]
        next unless n
        sieve.map! { |e| e > n && (e%n).zero? ? nil : e }
        sieve.compact!
      end
    end
  end
end