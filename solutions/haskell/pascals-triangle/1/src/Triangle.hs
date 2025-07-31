module Triangle (rows) where

rows :: Integer -> [[Integer]]
-- rows n = rows (n - 1) ++ [map ((n - 1) `binom`) [0 .. n - 1]]

rows 0 = []
rows nn = rows (nn - 1) ++ [[binom (nn - 1) i | i <- [0 .. nn - 1]]]
  where
    binom n k = product [1 + n - k .. n] `div` product [1 .. k]

