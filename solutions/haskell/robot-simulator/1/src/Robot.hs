module Robot
  ( Bearing (East, North, South, West),
    bearing,
    coordinates,
    mkRobot,
    move,
  )
where

data Bearing
  = North
  | East
  | South
  | West
  deriving (Eq, Show)

type Coord = (Integer, Integer)

data Robot = Robot Coord Bearing

bearing :: Robot -> Bearing
bearing (Robot _ b) = b

coordinates :: Robot -> Coord
coordinates (Robot c _) = c

mkRobot :: Bearing -> Coord -> Robot
mkRobot b c = Robot c b

advance :: Robot -> Robot
advance (Robot (x, y) b) =
  case b of
    North -> mkRobot b (x, y + 1)
    East -> mkRobot b (x + 1, y)
    South -> mkRobot b (x, y -1)
    West -> mkRobot b (x -1, y)

left :: Robot -> Robot
left (Robot c b) =
  case b of
    North -> mkRobot West c
    East -> mkRobot North c
    South -> mkRobot East c
    West -> mkRobot South c

right :: Robot -> Robot
right (Robot c b) =
  case b of
    North -> mkRobot East c
    East -> mkRobot South c
    South -> mkRobot West c
    West -> mkRobot North c

move :: Robot -> String -> Robot
move robot instructions =
  case instructions of
    "" -> robot
    (x : xs) -> case x of
      'A' -> move (advance robot) xs
      'L' -> move (left robot) xs
      'R' -> move (right robot) xs
      _ -> error "?"
