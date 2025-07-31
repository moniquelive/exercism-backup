module PigLatin (translate) where

translate :: String -> String
translate word
  | ' ' `elem` word = (unwords . map translate . words) word
  | take 3 word `elem` ["squ", "thr", "sch"] = pig 3
  | take 2 word `elem` ["ch", "qu", "th", "rh"] = pig 2
  | take 2 word `elem` ["xr", "yt"] || isVowel (head word) = word ++ "ay"
  | otherwise = pig 1
 where
  isVowel = flip elem "aeiou"
  pig n = drop n word ++ take n word ++ "ay"
