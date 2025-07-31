module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA xs
  | all (`elem` "GCTA") xs = Right (map translate xs)
  | otherwise = Left (head (filter (`notElem` "GCTA") xs))
  where
    translate 'G' = 'C'
    translate 'C' = 'G'
    translate 'T' = 'A'
    translate 'A' = 'U'
    translate _ = error "unexpected"
