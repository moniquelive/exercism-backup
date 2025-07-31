module DND
  ( Character (..),
    ability,
    modifier,
    character,
  )
where

import Control.Monad (replicateM)
import Data.List (sort)
import Test.QuickCheck (Gen, choose)

data Character = Character
  { strength :: Int,
    dexterity :: Int,
    constitution :: Int,
    intelligence :: Int,
    wisdom :: Int,
    charisma :: Int,
    hitpoints :: Int
  }
  deriving (Show, Eq)

modifier :: Int -> Int
modifier n = (n - 10) `div` 2

ability :: Gen Int
ability = sum . tail . sort <$> replicateM rolls (choose (1, 6))
  where
    rolls = 4

character :: Gen Character
character = genChar <$> replicateM 6 ability

genChar :: [Int] -> Character
genChar [str, dex, con, int, wis, cha] =
  Character str dex con int wis cha (10 + modifier con)
genChar _ = error "unexpected"
