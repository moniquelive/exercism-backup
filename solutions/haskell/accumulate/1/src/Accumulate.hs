module Accumulate (accumulate) where

accumulate :: (a -> b) -> [a] -> [b]
accumulate _ [] =
  []
accumulate fn (first : rest) =
  fn first : accumulate fn rest
