module ProteinTranslation (proteins) where

import Data.List.Split (chunksOf)
import qualified Data.Map as M

m :: M.Map String String
m =
  M.fromList
    [ ("AUG", "Methionine"),
      ("UUU", "Phenylalanine"),
      ("UUC", "Phenylalanine"),
      ("UUA", "Leucine"),
      ("UUG", "Leucine"),
      ("UCU", "Serine"),
      ("UCC", "Serine"),
      ("UCA", "Serine"),
      ("UCG", "Serine"),
      ("UAU", "Tyrosine"),
      ("UAC", "Tyrosine"),
      ("UGU", "Cysteine"),
      ("UGC", "Cysteine"),
      ("UGG", "Tryptophan"),
      ("UAA", "-"),
      ("UAG", "-"),
      ("UGA", "-")
    ]

proteins :: String -> Maybe [String]
proteins ps =
  let codons = chunksOf 3 ps
   in case mapM (m M.!?) codons of
        Nothing -> Just []
        Just x -> Just (takeWhile (/= "-") x)
