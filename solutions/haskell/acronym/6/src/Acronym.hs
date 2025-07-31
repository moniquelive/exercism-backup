{-# LANGUAGE OverloadedStrings #-}

module Acronym (abbreviate) where

import qualified Data.Char as C
import Data.Text (Text)
import qualified Data.Text as T

abbreviate :: Text -> Text
abbreviate = T.concat . map getAcronym . splitWords
 where
  getAcronym :: Text -> Text
  getAcronym xs
    | T.all C.isUpper xs = T.singleton . T.head $ xs
    | T.all C.isLower xs = T.singleton . C.toUpper . T.head $ xs
    | otherwise = T.filter C.isUpper xs

  splitWords :: Text -> [Text]
  splitWords = filter (not . T.null) . T.split (`elem` (" _-" :: String))
