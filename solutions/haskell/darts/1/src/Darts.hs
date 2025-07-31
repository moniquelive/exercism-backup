module Darts (score) where

score :: Float -> Float -> Int
score x y
  | dist > 10 = 0
  | dist <= 1 = 10
  | dist <= 5 = 5
  | otherwise = 1
 where
  dist = sqrt $ (x * x) + (y * y)
