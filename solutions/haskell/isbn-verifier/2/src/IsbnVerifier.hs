module IsbnVerifier (isbn) where

import qualified Data.Char as C
import Data.List (elemIndex)

isbn :: String -> Bool
isbn str = c1 clean && c2 clean && c3 clean
  where
    clean = filter (`elem` "0123456789X") str
    c1 = (== 10) . length
    c2 c = case elemIndex 'X' c of
      Nothing -> True
      Just 9 -> True
      _ -> False
    p c
      | C.isDigit c = C.digitToInt c
      | otherwise = 10
    c3 =
      (== 0)
        . (`mod` 11)
        . sum
        . zipWith (*) [10, 9 .. 1]
        . map p
