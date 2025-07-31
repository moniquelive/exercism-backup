{-# LANGUAGE ImportQualifiedPost #-}

module Transpose (transpose) where

import Data.List qualified (transpose)

transpose :: [String] -> [String]
transpose = Data.List.transpose . padAll

padAll :: [String] -> [String]
padAll [] = []
padAll [s] = [s]
padAll (s : ss) = padr (longest ss) s : padAll ss
 where
  longest = maximum . map length
  padr l str = str ++ replicate (l - length str) ' '
