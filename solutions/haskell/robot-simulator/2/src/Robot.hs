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
  deriving (Eq, Show, Enum)

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
left (Robot c North) = mkRobot West c
left (Robot c b) = mkRobot (pred b) c

right :: Robot -> Robot
right (Robot c West) = mkRobot North c
right (Robot c b) = mkRobot (succ b) c

move :: Robot -> String -> Robot
move robot instructions = foldl parse robot instructions
  where
    parse r 'A' = advance r
    parse r 'L' = left r
    parse r 'R' = right r
    parse _ _ = error "?"
