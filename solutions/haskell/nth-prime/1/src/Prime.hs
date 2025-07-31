module Prime (nth) where

nth :: Int -> Maybe Integer
nth 0 = Nothing
nth n = Just $ primes !! (n - 1)
 where
  primes = filterPrime [2 ..]
  filterPrime (p : xs) = p : filterPrime [ x | x <- xs, x `rem` p /= 0 ]
  filterPrime []       = []

