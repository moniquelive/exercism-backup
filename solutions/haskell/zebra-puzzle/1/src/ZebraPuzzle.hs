module ZebraPuzzle (Resident (..), Solution (..), solve) where

import Control.Monad (guard)
import Data.List (permutations, zip5)

data Solution = Solution
  { waterDrinker :: Resident
  , zebraOwner :: Resident
  }
  deriving (Eq, Show)

data Resident = Englishman | Spaniard | Ukrainian | Norwegian | Japanese deriving (Eq, Show, Enum)
data Color = Blue | Red | Ivory | Green | Yellow deriving (Eq, Enum)
data Drink = Tea | Coffee | Milk | Orange | Water deriving (Eq, Enum)
data Animal = Dog | Snails | Horse | Fox | Zebra deriving (Eq, Enum)
data Cigarette = Parliaments | OldGold | Kools | Chesterfields | LuckyStrike deriving (Eq, Enum)

solve :: Solution
solve = Solution{waterDrinker = whoDrinksWater, zebraOwner = whoOwnsZebra}
 where
  whoDrinksWater = head [resident | (_, resident, _, Water, _) <- solution]
  whoOwnsZebra = head [resident | (_, resident, Zebra, _, _) <- solution]
  solution = head $ do
    nationalities <- permutations [Englishman ..]
    guard $ head nationalities == Norwegian
    colors <- permutations [Blue ..]
    guard $ (Ivory, Green) `elem` zip colors (tail colors)
    guard $ (Englishman, Red) `elem` zip nationalities colors
    guard $ (Norwegian, Blue) `elem` zip nationalities (tail colors) || (Blue, Norwegian) `elem` zip colors (tail nationalities)
    drinks <- permutations [Tea ..]
    guard $ (Milk, 2) `elem` zip drinks ([0, 1, 2, 3, 4] :: [Int])
    guard $ (Coffee, Green) `elem` zip drinks colors
    guard $ (Ukrainian, Tea) `elem` zip nationalities drinks
    animals <- permutations [Dog ..]
    guard $ (Spaniard, Dog) `elem` zip nationalities animals
    cigarettes <- permutations [Parliaments ..]
    guard $ (OldGold, Snails) `elem` zip cigarettes animals
    guard $ (Kools, Yellow) `elem` zip cigarettes colors
    guard $ (LuckyStrike, Orange) `elem` zip cigarettes drinks
    guard $ (Japanese, Parliaments) `elem` zip nationalities cigarettes
    return $ zip5 colors nationalities animals drinks cigarettes
