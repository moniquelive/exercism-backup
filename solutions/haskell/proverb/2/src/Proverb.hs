module Proverb (recite) where

import Text.Printf (printf)

recite :: [String] -> String
recite [] = ""
recite pieces@(first : rest) =
  let
    verse = printf "For want of a %s the %s was lost."
    ending = printf "And all for the want of a %s."
   in
    init . unlines $ zipWith verse pieces rest ++ [ending first]
