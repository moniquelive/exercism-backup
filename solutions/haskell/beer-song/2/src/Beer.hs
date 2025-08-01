module Beer (song) where

import Data.List (intercalate)
import Text.Printf (printf)

song :: String
song = (intercalate "\n" . map verse) [99, 98 .. 0]
  where
    verse :: Int -> String
    verse 0 = "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    verse 1 = "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    verse 2 = "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
    verse n = printf "%d bottles of beer on the wall, %d bottles of beer.\nTake one down and pass it around, %d bottles of beer on the wall.\n" n n (n - 1)
