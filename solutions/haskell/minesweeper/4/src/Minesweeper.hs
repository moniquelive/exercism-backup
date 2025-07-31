module Minesweeper (annotate) where

annotate :: [String] -> [String]
annotate board = do
  row <- [0 .. length board - 1]
  return [annotationFor row col | col <- [0 .. length (board !! row) - 1]]
  where
    annotationFor row col
      | at row col == '*' = '*'
      | at row col == ' ' =
        sumToDigits
          [ fromEnum (at dr dc == '*')
            | dr <- [row - 1 .. row + 1],
              dc <- [col - 1 .. col + 1]
          ]
      | otherwise = error "impossibru"
    at r c
      | r < 0 || r >= length board || c < 0 || c >= length (board !! r) = ' '
      | otherwise = (board !! r) !! c
    sumToDigits = (!!) " 123456789" . sum
