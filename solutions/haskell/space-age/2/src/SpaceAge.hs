module SpaceAge (Planet(..), ageOn) where

import qualified Data.Map as M

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune
            deriving(Eq,Ord)

planetFactors :: M.Map Planet Float
planetFactors =
  M.fromList
    [ (Mercury, 0.2408467),
      (Venus, 0.61519726),
      (Earth, 1),
      (Mars, 1.8808158),
      (Jupiter, 11.862615),
      (Saturn, 29.447498),
      (Uranus, 84.016846),
      (Neptune, 164.79132)
    ]

earthYear :: Float
earthYear = 1.0 / (60 * 60 * 24 * 365.25)

ageOn :: Planet -> Float -> Float
ageOn planet seconds = seconds * earthYear / planetFactor
  where
    planetFactor = planetFactors M.! planet
