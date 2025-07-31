module Alphametics (solve) where

import Control.Monad (guard)
import Data.Char (isAlpha, isSpace)
import Data.List (nub, permutations)
import Data.Maybe (fromMaybe, listToMaybe)

solve :: String -> Maybe [(Char, Int)]
solve puzzle =
    listToMaybe
        ( do
            let (terms, result) = parseEquation puzzle
                letters = uniqueLetters puzzle
                nonZero = leadingLetters terms result
            digits <- permutations [0 .. 9]
            let assign = zip letters digits
            guard $ validAssignment assign nonZero
            guard $ equationHolds assign terms result
            return assign
        )
  where
    -- Parse the equation into terms and result
    parseEquation equation =
        let (lhs, rhs) = break (== '=') $ filter (not . isSpace) equation
            terms = words $ map (\c -> if c == '+' then ' ' else c) lhs
            result = filter isAlpha rhs
         in (terms, result)
    -- Extract unique letters from the puzzle
    uniqueLetters = nub . filter isAlpha
    -- Check if the assignment is valid (no leading zeros)
    leadingLetters terms result = nub $ map head (terms ++ [result])
    -- Check if the equation holds true with the given assignment
    equationHolds assign terms result = sum (map (wordVal assign) terms) == wordVal assign result
    -- Safe lookup with default value 0
    lookup' m = fromMaybe 0 . flip lookup m
    -- Get leading letters of terms and result
    wordVal m = foldl (\acc c -> acc * 10 + lookup' m c) 0
    -- Convert a word to its numeric value based on the assignment
    validAssignment assign = all ((/= 0) . lookup' assign)
