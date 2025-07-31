module ArmstrongNumbers (armstrong) where

import Data.Char

armstrong :: Int -> Bool
armstrong n = (== n) . sum . powers . map digitToInt . show $ n
  where
    powers x =
      let nDigits = length x
       in map (^ nDigits) x
