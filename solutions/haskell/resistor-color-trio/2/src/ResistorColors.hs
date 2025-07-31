module ResistorColors (Color (..), Resistor (..), label, ohms) where

data Color
  = Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Show, Enum, Bounded)

newtype Resistor = Resistor {bands :: (Color, Color, Color)}
  deriving (Show)

label :: Resistor -> String
label = format . ohms
  where
    format n
      | n > a_billion = show (n `div` a_billion) ++ " gigaohms"
      | n > a_million = show (n `div` a_million) ++ " megaohms"
      | n > a_thousand = show (n `div` a_thousand) ++ " kiloohms"
      | otherwise = show n ++ " ohms"
    a_billion = 1000000000
    a_million = 1000000
    a_thousand = 1000

ohms :: Resistor -> Int
ohms (Resistor (c1, c2, c3)) = (10 * fromEnum c1 + fromEnum c2) * 10 ^ fromEnum c3
