module StateOfTicTacToe (gameState, GameState (..)) where

data GameState = WinX | WinO | Draw | Ongoing | Impossible deriving (Eq, Show)

gameState :: [String] -> GameState
gameState board
  | countX > 1 && countO == 0
      || countO > countX
      || win 'X' && (countX <= countO)
      || win 'O' && (countO < countX) =
      Impossible
  | win 'X' = WinX
  | win 'O' = WinO
  | ' ' `notElem` flat = Draw
  | otherwise = Ongoing
 where
  flat = concat board
  countX = length [x | x <- flat, x == 'X']
  countO = length [x | x <- flat, x == 'O']
  win p =
    True
      `elem` [ (p, p, p) == (flat !! x, flat !! y, flat !! z)
             | (x, y, z) <-
                [ (0, 1, 2) -- lines
                , (3, 4, 5)
                , (6, 7, 8)
                , (0, 3, 6) -- cols
                , (1, 4, 7)
                , (2, 5, 8)
                , (0, 4, 8) -- diags
                , (2, 4, 6)
                ]
             ]
