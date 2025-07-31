module Queens (boardString, canAttack) where

type Row = String
type Board = [Row]

emptyRow :: Row
emptyRow = "_ _ _ _ _ _ _ _"

emptyBoard :: Board
emptyBoard = replicate 8 emptyRow

buildRow :: Row -> Int -> Char -> Row
buildRow s i c = take (i*2) s ++ [c] ++ drop (i*2+1) s

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
   in case (w, b) of
        (Nothing, Nothing) -> unlines (zipWith mix emptyBoard emptyBoard)
        (Just (wx, wy), Nothing) -> unlines (zipWith mix (whiteOnBoard wx wy) emptyBoard)
        (Nothing, Just (bx, by)) -> unlines (zipWith mix emptyBoard (blackOnBoard bx by))
        (Just (wx, wy), Just (bx, by)) -> unlines (zipWith mix (whiteOnBoard wx wy) (blackOnBoard bx by))

canAttack :: (Int, Int) -> (Int, Int) -> Bool
canAttack (x1, y1) (x2, y2)
  | x1 == x2 = True
  | y1 == y2 = True
  | abs (x1 - x2) == abs (y1 - y2) = True
  | otherwise = False
