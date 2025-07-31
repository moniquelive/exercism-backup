module FoodChain (song) where

import Data.Char (toLower)
import Text.Printf (printf)

data Animal = Fly | Spider | Bird | Cat | Dog | Goat | Cow | Horse deriving (Enum, Show)

name :: Animal -> String
name = map toLower . show

song :: String
song = concatMap verse [Fly ..]
 where
  verse = concat . sequence [intro, swallowed, conclusion]

  intro animal = printf "I know an old lady who swallowed a %s.\n%s" (name animal) (intro' animal)
  intro' Fly = ""
  intro' Spider = "It wriggled and jiggled and tickled inside her.\n"
  intro' Bird = "How absurd to swallow a bird!\n"
  intro' Cat = "Imagine that, to swallow a cat!\n"
  intro' Dog = "What a hog, to swallow a dog!\n"
  intro' Goat = "Just opened her throat and swallowed a goat!\n"
  intro' Cow = "I don't know how she swallowed a cow!\n"
  intro' Horse = "She's dead, of course!\n"

  swallowed Fly = ""
  swallowed Horse = ""
  swallowed upto = unlines . map swallowed' $ reverse [Fly .. (pred upto)]
  swallowed' animal = printf "She swallowed the %s to catch the %s%s." (name (succ animal)) (name animal) (descr animal)
  descr Spider = " that wriggled and jiggled and tickled inside her"
  descr _ = ""

  conclusion Horse = ""
  conclusion _ = "I don't know why she swallowed the fly. Perhaps she'll die.\n\n"
