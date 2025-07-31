{-# LANGUAGE DeriveFoldable #-}
{-# LANGUAGE ImportQualifiedPost #-}

module CustomSet (
  delete,
  difference,
  empty,
  fromList,
  insert,
  intersection,
  isDisjointFrom,
  isSubsetOf,
  member,
  null,
  size,
  toList,
  union,
) where

import Data.List qualified as L
import Prelude hiding (null)

newtype CustomSet a = CustomSet [a]
  deriving (Show, Foldable)

instance (Ord a, Eq a) => Eq (CustomSet a) where
  (==) (CustomSet ll1) (CustomSet ll2) = L.sort ll1 == L.sort ll2

delete :: Eq a => a -> CustomSet a -> CustomSet a
delete x (CustomSet ll) = CustomSet $ L.delete x ll

difference :: Eq a => CustomSet a -> CustomSet a -> CustomSet a
difference (CustomSet ll1) (CustomSet ll2) = CustomSet $ ll1 L.\\ ll2

empty :: CustomSet a
empty = CustomSet []

fromList :: [a] -> CustomSet a
fromList = CustomSet

insert :: Eq a => a -> CustomSet a -> CustomSet a
insert x (CustomSet ll) = CustomSet $ if x `L.elem` ll then ll else x : ll

intersection :: Eq a => CustomSet a -> CustomSet a -> CustomSet a
intersection (CustomSet ll1) (CustomSet ll2) = CustomSet $ L.intersect ll1 ll2

isDisjointFrom :: Eq a => CustomSet a -> CustomSet a -> Bool
isDisjointFrom (CustomSet ll1) (CustomSet ll2) = not . any (`L.elem` ll2) $ ll1

isSubsetOf :: Ord a => CustomSet a -> CustomSet a -> Bool
isSubsetOf (CustomSet ll1) (CustomSet ll2) = L.sort ll1 == L.take (length ll1) (L.sort ll2)

member :: Eq a => a -> CustomSet a -> Bool
member x set = x `L.elem` toList set

null :: CustomSet a -> Bool
null (CustomSet []) = True
null _ = False

size :: Eq a => CustomSet a -> Int
size = length . toList

toList :: Eq a => CustomSet a -> [a]
toList (CustomSet ll) = L.nub ll

union :: Eq a => CustomSet a -> CustomSet a -> CustomSet a
union = foldr insert
