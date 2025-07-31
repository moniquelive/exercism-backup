module Yacht (yacht, Category (..)) where

import qualified Data.List as L

data Category
  = Ones
  | Twos
  | Threes
  | Fours
  | Fives
  | Sixes
  | FullHouse
  | FourOfAKind
  | LittleStraight
  | BigStraight
  | Choice
  | Yacht

yacht :: Category -> [Int] -> Int
yacht category d =
  let dice = L.sort d
      groups = L.sortOn length . L.group $ dice
      count x = length . filter (== x)
   in case category of
        Ones -> 1 * count 1 dice
        Twos -> 2 * count 2 dice
        Threes -> 3 * count 3 dice
        Fours -> 4 * count 4 dice
        Fives -> 5 * count 5 dice
        Sixes -> 6 * count 6 dice
        FullHouse -> case length groups of
          2 -> if length (last groups) == 3 then sum dice else 0
          _ -> 0
        FourOfAKind -> case length groups of
          1 -> 4 * head dice
          2 -> if length (last groups) == 4 then sum . last $ groups else 0
          _ -> 0
        LittleStraight -> if dice == [1 .. 5] then 30 else 0
        BigStraight -> if dice == [2 .. 6] then 30 else 0
        Choice -> sum dice
        Yacht -> if length groups == 1 then 50 else 0
