{-# LANGUAGE DeriveFoldable #-}

module LinkedList (
    LinkedList,
    datum,
    fromList,
    isNil,
    new,
    next,
    nil,
    reverseLinkedList,
    toList,
) where

import Data.List (foldl')

data LinkedList a
    = Nil
    | Cons !a !(LinkedList a)
    deriving (Eq, Show, Foldable)

instance Semigroup (LinkedList a) where
    a <> a' = fromList $ toList a ++ toList a'

instance Monoid (LinkedList a) where
    mempty = Nil

datum :: LinkedList a -> a
datum Nil = error "empty list"
datum (Cons x _) = x

fromList :: [a] -> LinkedList a
fromList = foldr new mempty

isNil :: LinkedList a -> Bool
isNil Nil = True
isNil _ = False

new :: a -> LinkedList a -> LinkedList a
new = Cons

next :: LinkedList a -> LinkedList a
next Nil = Nil
next (Cons _ ll) = ll

nil :: LinkedList a
nil = mempty

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList = foldl' (flip new) mempty

toList :: LinkedList a -> [a]
toList = foldr (:) mempty
