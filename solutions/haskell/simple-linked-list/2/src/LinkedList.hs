{-# LANGUAGE DeriveFoldable #-}

module LinkedList
    ( LinkedList
    , datum
    , fromList
    , isNil
    , new
    , next
    , nil
    , reverseLinkedList
    , toList
    ) where

data LinkedList a = Nil | Cons a (LinkedList a)
  deriving (Eq, Show, Foldable)

datum :: LinkedList a -> a
datum Nil = error "empty list"
datum (Cons x _) = x

fromList :: [a] -> LinkedList a
fromList = foldr new nil

isNil :: LinkedList a -> Bool
isNil Nil = True
isNil _ = False

new :: a -> LinkedList a -> LinkedList a
new x ll = Cons x ll

next :: LinkedList a -> LinkedList a
next Nil = Nil
next (Cons _ ll) = ll

nil :: LinkedList a
nil = Nil

reverseLinkedList :: LinkedList a -> LinkedList a
reverseLinkedList = foldl (flip new) nil

toList :: LinkedList a -> [a]
toList = foldr (:) mempty
