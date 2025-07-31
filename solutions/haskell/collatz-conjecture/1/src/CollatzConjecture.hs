module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
  | n < 1 = Nothing
  | otherwise = Just (go n 0)
  where
    go :: Integer -> Integer -> Integer
    go x s
      | x == 1 = s
      | even x = go (x `div` 2) (s + 1)
      | otherwise = go (3 * x + 1) (s + 1)
