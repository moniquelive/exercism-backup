module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map)
import Data.MultiSet (fromList, toMap)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = toMap . fromList <$> mapM translate xs
  where
    translate 'A' = Right A
    translate 'C' = Right C
    translate 'G' = Right G
    translate 'T' = Right T
    translate _ = Left "error"
