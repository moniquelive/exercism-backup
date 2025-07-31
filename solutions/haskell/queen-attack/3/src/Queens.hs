module Queens (boardString, canAttack) where

type Row = String

type Board = [Row]

emptyRow :: Row
emptyRow = "_ _ _ _ _ _ _ _"

emptyBoard :: Board
emptyBoard = replicate 8 emptyRow

buildRow :: Row -> Int -> Char -> Row
buildRow s i c = take (i * 2) s ++ [c] ++ drop (i * 2 + 1) s

buildBoard :: Board -> Char -> Int -> Int -> Board
buildBoard b c y x = take y b ++ [buildRow emptyRow x c] ++ drop (y + 1) b

mix :: Row -> Row -> Row
mix w b
  | 'W' `elem` w = w
  | 'B' `elem` b = b
  | otherwise = emptyRow

boardString :: Maybe (Int, Int) -> Maybe (Int, Int) -> String
boardString w b =
  let whiteOnBoard = buildBoard emptyBoard 'W'
      blackOnBoard = buildBoard emptyBoard 'B'
   in unlines . uncurry (zipWith mix) $ case (w, b) of
        (Nothing, Nothing) -> (emptyBoard, emptyBoard)
        (Just (wx, wy), Nothing) -> (whiteOnBoard wx wy, emptyBoard)
        (Nothing, Just (bx, by)) -> (emptyBoard, blackOnBoard bx by)
        (Just (wx, wy), Just (bx, by)) -> (whiteOnBoard wx wy, blackOnBoard bx by)

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack (x1, y1) (x2, y2) =
  x1 == x2 || y1 == y2 || abs (x1 - x2) == abs (y1 - y2)
