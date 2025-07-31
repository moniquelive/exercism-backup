module SumOfMultiples (sumOfMultiples) where

import Data.Set (fromList)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit =
  sum . fromList . concatMap go $ zip factors (repeat limit)
  where
    go (x, y) = [n | n <- [x .. (y -1)], x > 0 && n `rem` x == 0]
