module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA xs = mconcat <$> mapM translate xs
  where
    translate 'G' = Right "C"
    translate 'C' = Right "G"
    translate 'T' = Right "A"
    translate 'A' = Right "U"
    translate c = Left c
