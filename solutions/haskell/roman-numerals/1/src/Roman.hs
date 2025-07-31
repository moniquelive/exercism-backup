{-# LANGUAGE OverloadedLists #-}

module Roman (numerals) where

m :: [(Integer, String)]
m =
    [ (1000, "M")
    , (900, "CM")
    , (500, "D")
    , (400, "CD")
    , (100, "C")
    , (90, "XC")
    , (50, "L")
    , (40, "XL")
    , (10, "X")
    , (9, "IX")
    , (5, "V")
    , (4, "IV")
    , (1, "I")
    ]

numerals :: Integer -> Maybe String
numerals n = if n < 0 || n > 3000 then Nothing else Just $ go n
  where
    go :: Integer -> String
    go x =
        if x < 1
            then ""
            else
                let (k, v) = head [(a, _b) | (a, _b) <- m, x >= a]
                 in v ++ go (x - k)
