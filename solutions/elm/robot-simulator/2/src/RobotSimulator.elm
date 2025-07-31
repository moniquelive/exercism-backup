module RobotSimulator exposing
    ( Bearing(..)
    , Robot
    , advance
    , defaultRobot
    , simulate
    , turnLeft
    , turnRight
    )

import Html.Attributes exposing (default)


type Bearing
    = North
    | East
    | South
    | West


type alias Robot =
    { bearing : Bearing
    , coordinates : { x : Int, y : Int }
    }


defaultRobot : Robot
defaultRobot =
    { bearing = North
    , coordinates = { x = 0, y = 0 }
    }


turnRight : Robot -> Robot
turnRight robot =
    case robot.bearing of
        North ->
            { robot | bearing = East }

        South ->
            { robot | bearing = West }

        East ->
            { robot | bearing = South }

        West ->
            { robot | bearing = North }


turnLeft : Robot -> Robot
turnLeft robot =
    case robot.bearing of
        North ->
            { robot | bearing = West }

        South ->
            { robot | bearing = East }

        East ->
            { robot | bearing = North }

        West ->
            { robot | bearing = South }


advance : Robot -> Robot
advance robot =
    let
        coords =
            robot.coordinates
    in
    case robot.bearing of
        North ->
            { robot | coordinates = { x = coords.x, y = coords.y + 1 } }

        South ->
            { robot | coordinates = { x = coords.x, y = coords.y - 1 } }

        East ->
            { robot | coordinates = { x = coords.x + 1, y = coords.y } }

        West ->
            { robot | coordinates = { x = coords.x - 1, y = coords.y } }


simulate : String -> Robot -> Robot
simulate directions robot =
    let
        move m r =
            case m of
                'L' ->
                    turnLeft r

                'R' ->
                    turnRight r

                'A' ->
                    advance r

                _ ->
                    r
    in
    String.foldl move robot directions
