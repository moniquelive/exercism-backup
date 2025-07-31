module DNA (nucleotideCounts, Nucleotide (..)) where

import Control.Monad (foldM)
import Data.Map (Map, adjust, fromList)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

readEither :: Char -> Either String Nucleotide
readEither 'A' = Right A
readEither 'C' = Right C
readEither 'G' = Right G
readEither 'T' = Right T
readEither _ = Left "error"

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts =
  let zeros = fromList $ zip [A, C, G, T] [0, 0, 0, 0]
   in foldM go zeros
  where
    go m n = do
      c <- readEither n
      return (adjust (+ 1) c m)
