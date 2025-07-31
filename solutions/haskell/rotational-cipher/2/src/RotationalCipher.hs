module RotationalCipher (rotate) where

import Data.Char (chr, isLower, isUpper, ord)

rotate :: Int -> String -> String
rotate n = map rotCaseInsensitive
  where
    rotCaseInsensitive ch
        | isUpper ch = rotCaseSensitive 'A' ch
        | isLower ch = rotCaseSensitive 'a' ch
        | otherwise = ch
    rotCaseSensitive base ch =
        chr $ ord base + (ord ch - ord base + n) `rem` 26
