module ArmstrongNumbers (armstrong) where

import Data.Char

armstrong :: Int -> Bool
armstrong n
  | n < 10 = True
  | n < 100 = False
  | otherwise = go n
  where
    go y = (== y) . sumPower . map digitToInt . show $ n
    sumPower x =
      let nDigits = length x
       in sum . map (^ nDigits) $ x
