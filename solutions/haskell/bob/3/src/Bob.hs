module Bob (responseFor) where

import qualified Data.Char as C
import Data.List

responseFor :: String -> String
responseFor xs
  | null trimmed = "Fine. Be that way!"
  | isAllCaps && isQuestion = "Calm down, I know what I'm doing!"
  | isAllCaps = "Whoa, chill out!"
  | isQuestion = "Sure."
  | otherwise = "Whatever."
  where
    trimmed = allTrim xs
    allTrim = trimLeft . trimRight
    trimLeft = dropWhile C.isSpace
    trimRight = dropWhileEnd C.isSpace

    isQuestion = last trimmed == '?'
    isAllCaps = all C.isUpper onlyLetters && (not . null) onlyLetters
      where
        onlyLetters = filter C.isAlpha trimmed
