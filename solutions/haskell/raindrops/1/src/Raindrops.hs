module Raindrops (convert) where

import Data.Foldable (fold)

convert :: Int -> String
convert n = case fold [go 3, go 5, go 7] of
  Just x -> x
  Nothing -> show n
  where
    go r = case n `rem` r of
      0 -> lookup r [(3, "Pling"), (5, "Plang"), (7, "Plong")]
      _ -> Nothing
