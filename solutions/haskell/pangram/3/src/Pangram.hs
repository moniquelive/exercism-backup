module Pangram (isPangram) where

import Data.Char(toLower)

isPangram :: String -> Bool
isPangram text = 26 == length (filter (`elem` lowerText) ['a' .. 'z'])
  where
    lowerText = map toLower text
