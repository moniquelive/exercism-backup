module SumOfMultiples (sumOfMultiples) where

import Data.Set (fromList)

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum . fromList . concatMap go $ factors
  where
    go x = [n | n <- [x .. (limit -1)], x > 0 && n `rem` x == 0]
