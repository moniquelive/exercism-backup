module CryptoSquare (encode) where

import Data.Char
import Data.List
import Data.List.Split

isqrt :: Int -> Int
isqrt n = ceiling . sqrt $ (fromIntegral n :: Float)

encode :: String -> String
encode xs = unwords . transpose . chunksOf cols $ normalized
 where
  normalized = map toLower . filter isAlphaNum $ xs
  cols = isqrt . length $ normalized

