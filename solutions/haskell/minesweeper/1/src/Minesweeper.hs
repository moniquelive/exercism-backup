module Minesweeper (annotate) where

import qualified Data.Char as C
import qualified Data.Text as T

annotate :: [String] -> [String]
annotate board
  | (T.concat . fmap (T.strip . T.pack) $ board) == T.empty = board
  | otherwise = [[cell r c | c <- [0 .. length (board !! r) - 1]] | r <- [0 .. length board - 1]]
  where
    cell r c
      | ch r c == '*' = '*'
      | otherwise =
        digit
          . sum
          . map fromEnum
          $ [ch rr cc == '*' | rr <- [r - 1 .. r + 1], cc <- [c - 1 .. c + 1]]
    digit n = if n == 0 then ' ' else C.intToDigit n
    ch r c
      | r < 0 || r >= length board || c < 0 || c >= length (board !! r) = ' '
      | otherwise = (board !! r) !! c
