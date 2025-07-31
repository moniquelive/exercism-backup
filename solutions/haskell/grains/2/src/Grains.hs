module Grains (square, total) where

square :: Integer -> Maybe Integer
square n
  | n >= 1 && n <= 64 = Just (2 ^ (n -1))
  | otherwise = Nothing

total :: Integer
total = go (2 ^ (63 :: Integer))
  where
    go 1 = 1
    go n = n + go (n `div` 2)
