module Squares (difference, squareOfSum, sumOfSquares) where

difference :: Integral a => a -> a
difference = foldr1 (-) . sequence [squareOfSum, sumOfSquares]

squareOfSum :: Integral a => a -> a
squareOfSum n = sum [1..n] ^ (2 :: Integer)

sumOfSquares :: Integral a => a -> a
sumOfSquares n = sum . map (^(2 :: Integer)) $ [1..n]
