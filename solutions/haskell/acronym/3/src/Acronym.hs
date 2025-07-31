{-# LANGUAGE OverloadedStrings #-}

module Acronym (abbreviate) where

import qualified Data.Char as C
import qualified Data.Text as T
import           Data.Text (Text)

abbreviate :: Text -> Text
abbreviate =
  T.concat
    . map (T.filter C.isUpper . acronyms . capitalFirst)
    . filter (not . T.null)
    . T.splitOn " "
    . T.replace "-" " "
 where
  acronyms :: Text -> Text
  acronyms s | T.all C.isUpper s = T.singleton . T.head $ s
             | otherwise         = s

  capitalFirst :: Text -> Text
  capitalFirst s = T.cons h t
   where
    h = C.toUpper . T.head $ s
    t = T.tail s
