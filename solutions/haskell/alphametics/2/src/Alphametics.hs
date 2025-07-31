module Alphametics (solve) where

import Data.Char (isAlpha)
import Data.List (find, nub, permutations)

import Data.Maybe (fromJust)

solve :: String -> Maybe [(Char, Int)]
solve puzzle = find check possibilities
  where
    chars = nub $ filter isAlpha puzzle
    possibilities = map (zip chars) (permutations [0 .. 9])
    terms = words $ map (\c -> if c `elem` "+=" then ' ' else c) puzzle
    leadingChars = nub $ map head terms
    check assign =
        all (nonZero assign) leadingChars
            && sum (map (wordVal assign) (init terms)) == wordVal assign (last terms)
    nonZero assign c = fromJust (lookup c assign) /= 0
    wordVal assign = foldl (\acc c -> acc * 10 + fromJust (lookup c assign)) 0
