module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

divisors :: Int -> [Int]
divisors n = [x | x <- [1 .. (n -1)], n `rem` x == 0]

aliquot :: Int -> Int
aliquot = sum . divisors

classify :: Int -> Maybe Classification
classify n
  | n <= 0 = Nothing
  | a < n = Just Deficient
  | a > n = Just Abundant
  | a == n = Just Perfect
  | otherwise = Nothing
  where
    a = aliquot n
