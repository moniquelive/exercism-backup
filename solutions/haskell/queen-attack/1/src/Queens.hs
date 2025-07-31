module Queens (boardString, canAttack) where

emptyRow :: String
emptyRow = "_ _ _ _ _ _ _ _"

emptyBoard :: [String]
emptyBoard = replicate 8 emptyRow

row :: String -> Int -> Char -> String
row s i c = take (i*2) s ++ [c] ++ drop (i*2+1) s

build :: [String] -> Int -> Int -> Char -> [String]
build b y x c = take y b ++ [row emptyRow x c] ++ drop (y+1) b

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString Nothing Nothing = unlines emptyBoard
boardString Nothing (Just (bx, by)) = unlines (build emptyBoard bx by 'B')
boardString (Just (wx, wy)) Nothing = unlines (build emptyBoard wx wy 'W')
boardString (Just (wx, wy)) (Just (bx, by)) = unlines blackOnBoard
  where
    whiteOnBoard = build emptyBoard wx wy 'W'
    blackOnBoard = build whiteOnBoard bx by 'B'

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack (x1, y1) (x2, y2)
  -- can attack on same rank
  | x1 == x2 = True
  -- can attack on same file
  | y1 == y2 = True
  -- can attack on first diagonal
  -- can attack on second diagonal
  -- can attack on third diagonal
  -- can attack on fourth diagonal
  | abs (x1 - x2) == abs (y1 - y2) = True
  | otherwise = False -- can not attack
