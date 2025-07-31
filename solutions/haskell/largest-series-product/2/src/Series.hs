module Series (Error (..), largestProduct) where

import Data.Char (digitToInt, isLetter)

data Error
  = InvalidSpan
  | InvalidDigit Char
  deriving (Show, Eq)

everyN :: Int -> [a] -> [[a]]
everyN n d
  | length d < n = []
  | otherwise = take n d : everyN n (tail d)

largestProduct :: Int -> String -> Either Error Integer
largestProduct size digits
  | size `notElem` [0 .. length digits] = Left InvalidSpan
  | not (null nonDigit) = Left (InvalidDigit (head nonDigit))
  | size == 0 = Right 1
  | otherwise = Right . maximum . map product . everyN size . map (toInteger . digitToInt) $ digits
 where
  nonDigit = filter isLetter digits
