module Diamond (diamond) where

diamond :: Char -> Maybe [String]
diamond c
  | c < 'A' || c > 'Z' = Nothing
  | otherwise =
    let delta = (fromEnum c - fromEnum 'A') + 1
        lst =
          map (line delta) [0 .. delta -1]
            ++ map (line delta) [delta -2, delta -3 .. 0]
     in Just lst
  where
    line s n =
      let ch = [toEnum (fromEnum 'A' + n)]
          half = replicate (s - n - 1) ' ' ++ ch ++ replicate n ' '
       in half ++ tail (reverse half)
