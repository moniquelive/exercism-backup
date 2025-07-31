module GameOfLife (tick) where

tick :: [[Int]] -> [[Int]]
tick board =
  [ [cell r c | c <- [0 .. length (board !! r) - 1]]
  | r <- [0 .. length board - 1]
  ]
 where
  cell r c
    | alive && (n == 2 || n == 3) = 1 -- Any live cell with two or three live neighbors lives on.
    | dead && (n == 3) = 1 -- Any dead cell with exactly three live neighbors becomes a live cell.
    | otherwise = 0 -- All other cells die or stay dead.
   where
    alive = ((board !! r) !! c) == 1
    dead = ((board !! r) !! c) == 0
    n = countNeighbours r c

  countNeighbours :: Int -> Int -> Int
  countNeighbours r c =
    sum
      [ board !! y !! x
      | dy <- [-1 .. 1]
      , dx <- [-1 .. 1]
      , (dx, dy) /= (0, 0)
      , let y = r + dy
      , let x = c + dx
      , y `elem` [0 .. length board - 1]
      , x `elem` [0 .. length board - 1]
      ]
