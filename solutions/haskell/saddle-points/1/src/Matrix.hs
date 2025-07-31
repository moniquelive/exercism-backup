{-# LANGUAGE ImportQualifiedPost #-}

module Matrix (saddlePoints) where

import Data.Array (Array, (!))
import Data.Array qualified as A

saddlePoints :: Array (Int, Int) Int -> [(Int, Int)]
saddlePoints matrix =
  [ (r, c)
    | ((r, c), v) <- A.assocs matrix,
      (v >=) . maximum . row $ r,
      (v <=) . minimum . col $ c
  ]
  where
    is = A.indices matrix
    row r = map (matrix !) . filter (\(rr, _) -> rr == r) $ is
    col c = map (matrix !) . filter (\(_, cc) -> cc == c) $ is
