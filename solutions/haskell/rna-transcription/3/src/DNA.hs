module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA "" = Right ""
toRNA (x : xs) = case toRNA xs of
  Left c -> Left c
  Right s -> case x of
    'G' -> Right ('C' : s)
    'C' -> Right ('G' : s)
    'T' -> Right ('A' : s)
    'A' -> Right ('U' : s)
    c -> Left c
