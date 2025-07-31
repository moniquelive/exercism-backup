module Sublist (sublist) where

sublist :: Eq a => Ord a => [a] -> [a] -> Maybe Ordering
sublist xs ys
  | xs == ys = Just EQ
  | isSub ys xs = Just GT
  | isSub xs ys = Just LT
  | otherwise = Nothing
  where
    isSub a b =
      length b >= length a
        && ( case b of
               [] -> False
               (_ : bs) -> (a == take (length a) b) || isSub a bs
           )
