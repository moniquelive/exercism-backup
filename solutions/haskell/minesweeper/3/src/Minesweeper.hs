module Minesweeper (annotate) where

import Data.Char (intToDigit)

annotate :: [String] -> [String]
annotate board = do
  row <- [0 .. length board - 1]
  return (annotationFor row <$> [0 .. length (board !! row) - 1])
  where
    annotationFor row col
      | at row col == '*' = '*'
      | otherwise =
        digit
          . sum
          . map fromEnum
          $ [at dr dc == '*' | dr <- [row - 1 .. row + 1], dc <- [col - 1 .. col + 1]]
    at r c
      | r < 0 || r >= length board || c < 0 || c >= length (board !! r) = ' '
      | otherwise = (board !! r) !! c
    digit 0 = ' '
    digit n = intToDigit n
