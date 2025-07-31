{-# LANGUAGE ImportQualifiedPost #-}

module RotationalCipher (rotate) where

import Data.Char qualified as C

rotate :: Int -> String -> String
rotate n =
    let
        calc amt ch base =
            C.chr $ C.ord base + (C.ord ch - C.ord base + amt) `rem` 26
        rot nn ch
            | C.isUpper ch = calc nn ch 'A'
            | C.isLower ch = calc nn ch 'a'
            | otherwise = ch
     in
        map (rot n)
