{-# LANGUAGE TypeApplications #-}

module CryptoSquare (encode) where

import Data.Char (isAlphaNum, toLower)
import Data.List (transpose)
import Data.List.Split (chunksOf)

rightPad :: Int -> String -> String
rightPad n x = take n $ x ++ repeat ' '

encode :: String -> String
encode xs =
    let
        sanitized = map toLower . filter isAlphaNum $ xs
        square = sqrt @Double . fromIntegral . length $ sanitized
        c = ceiling square
        r = round square
     in
        unwords . transpose . chunksOf c . rightPad (c * r) $ sanitized
