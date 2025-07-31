module BST
  ( BST,
    bstLeft,
    bstRight,
    bstValue,
    empty,
    fromList,
    insert,
    singleton,
    toList,
  )
where

data BST a = Nil | Node (BST a) a (BST a)
  deriving (Eq, Show)

bstLeft :: BST a -> Maybe (BST a)
bstLeft Nil = Nothing
bstLeft (Node left _ _) = Just left

bstRight :: BST a -> Maybe (BST a)
bstRight Nil = Nothing
bstRight (Node _ _ right) = Just right

bstValue :: BST a -> Maybe a
bstValue Nil = Nothing
bstValue (Node _ x _) = Just x

empty :: BST a
empty = Nil

fromList :: Ord a => [a] -> BST a
fromList lst = foldr insert empty (reverse lst)

insert :: Ord a => a -> BST a -> BST a
insert x Nil = singleton x
insert x (Node left a right)
  | x <= a = Node (insert x left) a right
  | x > a = Node left a (insert x right)
insert _ _ = error "unexpected state"

singleton :: a -> BST a
singleton x = Node Nil x Nil

toList :: BST a -> [a]
toList Nil = []
toList (Node left x right) = toList left ++ [x] ++ toList right
