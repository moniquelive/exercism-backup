module Pangram (isPangram) where

import Data.Char

isPangram :: String -> Bool
isPangram text =
  let a_z = ['a' .. 'z']
      lower = map toLower text
   in a_z == filter (`elem` lower) a_z
