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
        cr = ceiling . sqrt @Double . fromIntegral . length $ sanitized
     in
        unwords . map (rightPad cr) . transpose . chunksOf cr $ sanitized
