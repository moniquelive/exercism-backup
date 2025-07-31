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
foldr f z xs = foldl' (flip f) z (reverse xs)

length :: [a] -> Int
length = go 0
 where
  go acc [] = acc
  go acc (_ : xs) = go (acc + 1) xs

reverse :: [a] -> [a]
reverse = go []
 where
  go acc [] = acc
  go acc (x : xs) = go (x : acc) xs

map :: (a -> b) -> [a] -> [b]
map _ [] = []
map f (x : xs) = f x : map f xs

filter :: (a -> Bool) -> [a] -> [a]
filter _ [] = []
filter p (x : xs)
  | p x = x : filter p xs
  | otherwise = filter p xs

(++) :: [a] -> [a] -> [a]
[] ++ ys = ys
(x : xs) ++ ys = x : (xs ++ ys)

concat :: [[a]] -> [a]
concat = foldr (++) []
