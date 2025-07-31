module Triangle (TriangleType (..), triangleType) where

data TriangleType
  = Equilateral
  | Isosceles
  | Scalene
  | Illegal
  deriving (Eq, Show)

triangleType :: (Num a, Ord a) => a -> a -> a -> TriangleType
triangleType a b c
  | m >= (a + b + c - m) = Illegal
  | a == b && b == c = Equilateral
  | a == b || b == c || a == c = Isosceles
  | a /= b && b /= c && a /= c = Scalene
  | otherwise = error "?"
  where
    m = maximum [a, b, c]
