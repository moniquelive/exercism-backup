module PrimeFactors (primeFactors) where

primes :: [Integer]
primes = 2 : filter (\n -> head (primeFactors n) == n) [3, 5 ..]

primeFactors :: Integer -> [Integer]
primeFactors n = go n (head primes) (tail primes)
  where
    go m x xs
      | m < 2 = []
      | m < x ^ (2 :: Integer) = [m]
      | mod m x == 0 = x : go (div m x) x xs
      | otherwise = go m (head xs) (tail xs)
