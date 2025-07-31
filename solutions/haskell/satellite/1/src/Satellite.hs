module Satellite (treeFromTraversals) where

import BinaryTree (BinaryTree (..))
import Data.List (elemIndex, nub, sort)
import Data.Maybe (fromMaybe)

go :: (Ord a) => [a] -> [a] -> BinaryTree a
go [] _ = Leaf
go _ [] = Leaf
go (ph : ps) inorder =
  let
    root_ndx = fromMaybe 0 $ elemIndex ph inorder
    li = take root_ndx inorder
    ri = drop (1 + root_ndx) inorder
    lil = length li
    lp = take (1 + lil) ps
    rp = drop lil ps
   in
    Branch (go lp li) ph (go rp ri)

treeFromTraversals :: (Ord a) => [a] -> [a] -> Maybe (BinaryTree a)
treeFromTraversals po io
  | null po || null io = Nothing
  | length po /= length io = Nothing
  | sort po /= sort io = Nothing
  | nub po /= po || nub io /= io = Nothing
  | otherwise = Just $ go po io
