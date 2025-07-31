module Triangle (TriangleType (..), triangleType) where

import Data.List as L

data TriangleType
  = Equilateral
  | Isosceles
  | Scalene
  | Illegal
  deriving (Eq, Show)

triangleType :: (Num a, Ord a) => a -> a -> a -> TriangleType
triangleType a b c
  | z >= (x + y) = Illegal
  | x == y && y == z = Equilateral
  | x == y || y == z = Isosceles
  | x /= y && y /= z = Scalene
  | otherwise = error "?"
  where
    [x, y, z] = L.sort [a, b, c]
