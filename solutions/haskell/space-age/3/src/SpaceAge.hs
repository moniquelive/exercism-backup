module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune
            deriving(Eq,Ord)

ageOn :: Planet -> Float -> Float
ageOn planet seconds = seconds * earthYear / planetFactor planet
  where
    earthYear = 1.0 / (60 * 60 * 24 * 365.25)
    planetFactor Mercury = 0.2408467
    planetFactor Venus = 0.61519726
    planetFactor Earth = 1
    planetFactor Mars = 1.8808158
    planetFactor Jupiter = 11.862615
    planetFactor Saturn = 29.447498
    planetFactor Uranus = 84.016846
    planetFactor Neptune = 164.79132
