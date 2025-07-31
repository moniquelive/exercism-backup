module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA xs = go (span (`elem` "GCTA") xs)
  where
    go (ys, []) = Right (map translate ys)
    go (_, ys) = Left (head ys)

    translate 'G' = 'C'
    translate 'C' = 'G'
    translate 'T' = 'A'
    translate 'A' = 'U'
    translate _ = error "unexpected"
