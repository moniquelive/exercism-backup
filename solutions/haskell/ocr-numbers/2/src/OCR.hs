{-# LANGUAGE ImportQualifiedPost #-}

module OCR (convert) where

import Data.List (intercalate, transpose)
import Data.List.Split (chunksOf)
import Data.Map.Lazy qualified as M

mm :: M.Map String Int
mm =
  M.fromList
    [ (" _ \n| |\n|_|\n   \n", 0)
    , ("   \n  |\n  |\n   \n", 1)
    , (" _ \n _|\n|_ \n   \n", 2)
    , (" _ \n _|\n _|\n   \n", 3)
    , ("   \n|_|\n  |\n   \n", 4)
    , (" _ \n|_ \n _|\n   \n", 5)
    , (" _ \n|_ \n|_|\n   \n", 6)
    , (" _ \n  |\n  |\n   \n", 7)
    , (" _ \n|_|\n|_|\n   \n", 8)
    , (" _ \n|_|\n _|\n   \n", 9)
    ]

convert :: String -> String
convert xs = intercalate "," $ map (toString . groupByDigit) (splitLines xs)
 where
  splitLines = chunksOf 4 . lines
  groupByDigit = map unlines . transpose . map (chunksOf 3)
  toString = concatMap (maybe "?" show . getMaybeDigit)
  getMaybeDigit = (mm M.!?)
