module Proverb (recite) where

import Text.Printf (printf)

recite :: [String] -> String
recite [] = ""
recite pieces@(first : rest) = init . unlines $ zipWith (curry verse) pieces rest ++ [ending]
 where
  verse (x, y) = printf "For want of a %s the %s was lost." x y
  ending = printf "And all for the want of a %s." first
