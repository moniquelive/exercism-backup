module Luhn (isValid) where

import Data.Char

everynth :: Int -> [a] -> [a]
everynth n xs | length xs <= 1 = []
              | otherwise      = y : everynth n ys
  where y : ys = drop (n - 1) xs

isValid :: String -> Bool
isValid n | length digits <= 1 = False
          | otherwise          = s `rem` 10 == 0
 where
  dbl d | d * 2 > 9 = d * 2 - 9
        | otherwise = d * 2
  digits  = map digitToInt . concat . words $ n
  rev     = reverse digits
  doubled = map dbl $ everynth 2 rev
  others  = head rev : everynth 2 (tail rev)
  s       = sum doubled + sum others
