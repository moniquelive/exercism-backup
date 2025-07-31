module RationalNumbers (
  Rational,
  abs,
  numerator,
  denominator,
  add,
  sub,
  mul,
  div,
  pow,
  expRational,
  expReal,
  rational,
) where

import Prelude hiding (Rational, abs, div)

-- Data definition -------------------------------------------------------------
newtype Rational a = Rational (a, a) deriving (Eq, Show)

rational :: (Integral a) => (a, a) -> Rational a
rational (x, y) =
  let gcf = gcd x y
      n = quot x gcf
      d = quot y gcf
      f = signum d
   in Rational (n * f, d * f)

-- unary operators -------------------------------------------------------------
abs :: (Integral a) => Rational a -> Rational a
abs (Rational (x, y)) = Rational (x * signum x, y * signum y)

numerator :: (Integral a) => Rational a -> a
numerator (Rational (x, _)) = x

denominator :: (Integral a) => Rational a -> a
denominator (Rational (_, y)) = y

-- binary operators ------------------------------------------------------------
add :: (Integral a) => Rational a -> Rational a -> Rational a
add (Rational (a1, b1)) (Rational (a2, b2)) = rational (a1 * b2 + a2 * b1, b1 * b2)

sub :: (Integral a) => Rational a -> Rational a -> Rational a
sub (Rational (a1, b1)) (Rational (a2, b2)) = rational (a1 * b2 - a2 * b1, b1 * b2)

mul :: (Integral a) => Rational a -> Rational a -> Rational a
mul (Rational (a1, b1)) (Rational (a2, b2)) = rational (a1 * a2, b1 * b2)

div :: (Integral a) => Rational a -> Rational a -> Rational a
div (Rational (a1, b1)) (Rational (a2, b2)) = rational (a1 * b2, a2 * b1)

pow :: (Integral a) => Rational a -> a -> Rational a
pow (Rational (a, b)) n
  | n < 0 = rational (b ^ nn, a ^ nn)
  | otherwise = rational (a ^ nn, b ^ nn)
 where
  nn = n * signum n

expRational :: (Integral a, Ord b, Floating b) => Rational a -> b -> b
expRational (Rational (a, b)) n
  | n < 0 = fromIntegral b ** nn / fromIntegral a ** nn
  | otherwise = fromIntegral a ** nn / fromIntegral b ** nn
 where
  nn = n * signum n

expReal :: (Floating a, Integral b) => a -> Rational b -> a
expReal n (Rational (a, b)) = n ** (fromIntegral a / fromIntegral b)
