module Sublist (sublist) where

import Data.List (isInfixOf)

sublist :: Eq a => Ord a => [a] -> [a] -> Maybe Ordering
sublist xs ys
  | xs == ys = Just EQ
  | ys `isInfixOf` xs = Just GT
  | xs `isInfixOf` ys = Just LT
  | otherwise = Nothing
