module Bob (responseFor) where

import Control.Monad (liftM2)
import qualified Data.Char as C
import Data.List

responseFor :: String -> String
responseFor xs
  | null trimmed = "Fine. Be that way!"
  | isAllCaps trimmed && isQuestion trimmed = "Calm down, I know what I'm doing!"
  | isAllCaps trimmed = "Whoa, chill out!"
  | isQuestion trimmed = "Sure."
  | otherwise = "Whatever."
  where
    trimmed = allTrim xs
    allTrim = trimLeft . trimRight
    trimLeft = dropWhile C.isSpace
    trimRight = dropWhileEnd C.isSpace

    isQuestion = (==) '?' . last
    isAllCaps =
      liftM2 (&&) (all C.isUpper) (not . null)
        . filter C.isAlpha
