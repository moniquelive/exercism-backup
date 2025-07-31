{-# LANGUAGE TypeApplications #-}
module CryptoSquare (encode) where

import Data.Char
import Data.List

chop :: Int -> [a] -> [[a]]
chop _ [] = []
chop n xs = take n xs : chop n (drop n xs)

join :: Int -> [String] -> String
join _ []       = []
join n (x : xs) = x ++ replicate (n - length x) ' ' ++ " " ++ join n xs

encode :: String -> String
encode xs = join r arr
 where
  s = map toLower $ filter isAlphaNum xs
  c | rr == r   = r
    | otherwise = r + 1

  rr  = (ceiling . sqrt @Double . fromIntegral . length) s :: Int
  r   = (truncate . sqrt @Double . fromIntegral . length) s :: Int

  arr = transpose $ chop c s
