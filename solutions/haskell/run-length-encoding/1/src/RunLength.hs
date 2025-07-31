module RunLength (decode, encode) where

import Data.List

readInt :: String -> Int
readInt = read

decode :: String -> String
decode "" = []
decode encoded@(x : xs) =
  case span (`elem` "0123456789") encoded of
    ("", _) -> x : decode xs
    (a, b) -> replicate (readInt a) (head b) ++ decode (tail b)

encode :: String -> String
encode "" = ""
encode text =
  concatMap
    (\s -> if length s == 1 then s else show (length s) ++ [head s])
    (group text)
