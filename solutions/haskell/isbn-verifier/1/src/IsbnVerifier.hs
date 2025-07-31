module IsbnVerifier (isbn) where

import qualified Data.Char as C
import Data.List (elemIndex)
import qualified Data.Maybe as M

isbn :: String -> Bool
isbn str = c1 && c2 && c3 nodashes
  where
    nodashes = filter (/= '-') str
    parse c
      | C.isDigit c = Just (C.digitToInt c)
      | c == 'X' = Just 10
      | otherwise = Nothing
    c1 = 10 == length nodashes
    c2 = case elemIndex 'X' nodashes of
      Nothing -> True
      Just 9 -> True
      _ -> False
    c3 =
      (== 0)
        . (`mod` 11)
        . sum
        . zipWith (*) [10, 9 .. 1]
        . M.mapMaybe parse
