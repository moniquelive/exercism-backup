module Beer (song) where

import Data.Char (toLower)

song :: String
song = (unlines . map verse) [99, 98 .. 0]
  where
    verse :: Int -> String
    verse n =
        (beers n)
            ++ " on the wall, "
            ++ (map toLower $ beers n)
            ++ (conclusion n)
            ++ (less n)
            ++ " on the wall."
            ++ (end n)

    beers :: Int -> String
    beers 0 = "No more bottles of beer"
    beers 1 = "1 bottle of beer"
    beers n = (show n) ++ " bottles of beer"

    less :: Int -> String
    less 0 = beers 99
    less 1 = map toLower $ beers 0
    less n = beers (n - 1)

    conclusion :: Int -> String
    conclusion 0 = ".\nGo to the store and buy some more, "
    conclusion 1 = ".\nTake it down and pass it around, "
    conclusion _ = ".\nTake one down and pass it around, "

    end :: Int -> String
    end 0 = ""
    end _ = "\n"
