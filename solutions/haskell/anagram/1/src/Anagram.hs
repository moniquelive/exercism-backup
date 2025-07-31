module Anagram (anagramsFor) where

import Data.Char (toLower)
import Data.List

anagramsFor :: String -> [String] -> [String]
anagramsFor word candidates = nub $ filter (\w -> any (cmpIgnoreCase w) combs) cleanCandidates
  where combs = permutations word :: [String]
        cleanCandidates = filter (not . cmpIgnoreCase word) candidates :: [String]
        cmpIgnoreCase :: String -> String -> Bool
        cmpIgnoreCase s1 s2 = (map toLower s1) == (map toLower s2)

