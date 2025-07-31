{-# LANGUAGE BangPatterns #-}

module ListOps (
  length,
  reverse,
  map,
  filter,
  foldr,
  foldl',
  (++),
  concat,
) where

import Prelude hiding (
  concat,
  filter,
  foldr,
  length,
  map,
  reverse,
  (++),
 )

foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' _ !z [] = z
foldl' f z (x : xs) = foldl' f (f z x) xs

foldr :: (a -> b -> b) -> b -> [a] -> b
foldr _ z [] = z
foldr f z (x : xs) = f x (foldr f z xs)

length :: [a] -> Int
length = foldl' (\acc _ -> acc + 1) 0

reverse :: [a] -> [a]
reverse = foldl' (flip (:)) []

map :: (a -> b) -> [a] -> [b]
map f = foldr ((:) . f) []

filter :: (a -> Bool) -> [a] -> [a]
filter p = foldr (\e acc -> if p e then e : acc else acc) []

(++) :: [a] -> [a] -> [a]
xs ++ ys = foldr (:) ys xs

concat :: [[a]] -> [a]
concat = foldr (++) []
