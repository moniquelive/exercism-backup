module DND ( Character(..)
           , ability
           , modifier
           , character
           ) where

import Test.QuickCheck (Gen,choose)
import Data.List (sort)

data Character = Character
  { strength     :: Int
  , dexterity    :: Int
  , constitution :: Int
  , intelligence :: Int
  , wisdom       :: Int
  , charisma     :: Int
  , hitpoints    :: Int
  }
  deriving (Show, Eq)

modifier :: Int -> Int
modifier n =
  ((n - 10) `div` 2)

ability :: Gen Int
ability = do
  d1 <- choose(1,6)
  d2 <- choose(1,6)
  d3 <- choose(1,6)
  d4 <- choose(1,6)
  return . sum . take 3 . sort $ [d1, d2, d3, d4]

character :: Gen Character
character = do
  s <- ability
  d <- ability
  c <- ability
  i <- ability
  w <- ability
  ch <- ability
  return $ Character s d c i w ch (10 + modifier c)
