module WordCount (wordCount) where

import Control.Monad (liftM2)
import Data.Char
import Data.List.Split
import qualified Data.MultiSet as MS

wordCount :: String -> [(String, Int)]
wordCount xs = MS.toOccurList . MS.fromList $ extract xs
  where
    extract =
      map ap
        . wordsBy (liftM2 (||) isSpace (== ','))
        . filter (`notElem` ".:!@#$%^&*")
        . map toLower
    ap ('\'' : word) = init word
    ap word = word

