module Pangram (isPangram) where

import Data.Char
import Data.List

isPangram :: String -> Bool
isPangram text =
  let a_z = ['a' .. 'z']
      clean = nub . sort . intersect a_z . map toLower
   in a_z == clean text
