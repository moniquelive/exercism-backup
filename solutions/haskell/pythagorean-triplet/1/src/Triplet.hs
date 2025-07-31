module Triplet (tripletsWithSum) where

import Data.Maybe (mapMaybe)

tripletsWithSum :: Int -> [(Int, Int, Int)]
tripletsWithSum s = mapMaybe go [3 .. (s `div` 3)]
 where
  go a =
    let b_plus_c = s - a
        b = (b_plus_c * b_plus_c - a * a) `div` (2 * b_plus_c)
        c = s - a - b
     in if a < b && a * a + b * b == c * c
          then Just (a, b, c)
          else Nothing
