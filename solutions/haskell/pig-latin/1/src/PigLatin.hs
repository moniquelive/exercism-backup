module PigLatin (translate) where

import Data.List (elemIndex, findIndex, isPrefixOf)
import Data.Maybe (fromMaybe)

translate :: String -> String
translate = unwords . map translateWord . words
 where
  isVowel = flip elem "aeiou"
  translateWord word
    | isVowel (head word) || any (`isPrefixOf` word) ["xr", "yt"] = word ++ "ay"
    | any (`isPrefixOf` drop i word) ["squ", "thr", "sch"] = pig 3
    | any (`isPrefixOf` drop i word) ["ch", "qu", "th"] || k `elem` [1 .. length word - 2] = pig 2
    | j > -1 = pig 1
    | otherwise = error "unreachable"
   where
    i = fromMaybe (-1) $ findIndex (`elem` "bcdfghjklmnpqrstvwxyz") word
    j = fromMaybe (-1) $ findIndex (`elem` "bcdfghjklmnpqrstvwxz") word
    k = fromMaybe (-1) $ elemIndex 'y' word
    pig n = drop (i + n) word ++ take (i + n) word ++ "ay"
