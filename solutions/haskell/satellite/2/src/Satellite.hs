module Satellite (treeFromTraversals) where

import BinaryTree (BinaryTree (..))
import Data.List (nub, (\\))

treeFromTraversals :: (Ord a) => [a] -> [a] -> Maybe (BinaryTree a)
treeFromTraversals pp ii = go (nub pp) (nub ii)
 where
  go [] _ = Nothing
  go _ [] = Nothing
  go [root] [_] = Just $ Branch Leaf root Leaf
  go (root : ps) is =
    let (l, r) = span (/= root) is
     in Branch
          <$> go (ps \\ r) l
          <*> Just root
          <*> go (ps \\ l) (drop 1 r)
