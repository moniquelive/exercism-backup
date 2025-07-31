module ComplexNumbers
  ( Complex,
    conjugate,
    abs,
    exp,
    real,
    imaginary,
    mul,
    add,
    sub,
    div,
    complex,
  )
where

import Prelude hiding (abs, div, exp)

-- Data definition -------------------------------------------------------------
newtype Complex a = Complex (a, a) deriving (Eq, Show)

complex :: (a, a) -> Complex a
complex = Complex

-- unary operators -------------------------------------------------------------
conjugate :: Num a => Complex a -> Complex a
conjugate (Complex (i, j)) = Complex (i, negate j)

abs :: Floating a => Complex a -> a
abs (Complex (i, j)) = sqrt ((i * i) + (j * j))

real :: Num a => Complex a -> a
real (Complex (i, _)) = i

imaginary :: Num a => Complex a -> a
imaginary (Complex (_, j)) = j

exp :: Floating a => Complex a -> Complex a
exp (Complex (i, j)) =
  let e = 2.718281828459045
   in Complex (e ** i * cos j, sin j)

-- binary operators ------------------------------------------------------------
mul :: Num a => Complex a -> Complex a -> Complex a
mul (Complex (a, b)) (Complex (c, d)) =
  Complex
    ( a * c - b * d,
      b * c + a * d
    )

add :: Num a => Complex a -> Complex a -> Complex a
add (Complex (a, b)) (Complex (c, d)) =
  Complex (a + c, b + d)

sub :: Num a => Complex a -> Complex a -> Complex a
sub (Complex (a, b)) (Complex (c, d)) =
  Complex (a - c, b - d)

div :: Fractional a => Complex a -> Complex a -> Complex a
div (Complex (a, b)) (Complex (c, d)) =
  Complex
    ( (a * c + b * d) / (c * c + d * d),
      (b * c - a * d) / (c * c + d * d)
    )
