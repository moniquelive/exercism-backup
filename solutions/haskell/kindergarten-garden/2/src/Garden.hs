module Garden
  ( Plant (..),
    garden,
    lookupPlants,
  )
where

import Data.List.Split (chunksOf)

data Plant
  = Clover
  | Grass
  | Radishes
  | Violets
  deriving (Eq, Show)

type Garden = [(String, [Plant])]

garden :: [String] -> String -> Garden
garden students plants =
  let (l1, l2) = (toTuple . lines) plants
      (p1, p2) = (map strToPlant l1, map strToPlant l2)
      (c1, c2) = (chunksOf 2 p1, chunksOf 2 p2)
      zipped = zipWith (++) c1 c2
   in zip students zipped
  where
    strToPlant c =
      case lookup c [('C', Clover), ('G', Grass), ('R', Radishes), ('V', Violets)] of
        Just plant -> plant
        Nothing -> error ("unexpected plant " ++ [c])

    toTuple [a, b] = (a, b)
    toTuple _ = error "more than 2 lines!"

lookupPlants :: String -> Garden -> [Plant]
lookupPlants student grdn =
  case lookup student grdn of
    Just plants -> plants
    Nothing -> error ("unknown student " ++ student)
