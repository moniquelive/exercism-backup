module TopScorers exposing (..)

import Dict exposing (Dict)
import TopScorersSupport exposing (PlayerName)


updateGoalCountForPlayer : PlayerName -> Dict PlayerName Int -> Dict PlayerName Int
updateGoalCountForPlayer playerName playerGoalCounts =
    Dict.update playerName (Maybe.withDefault 0 >> (+) 1 >> Just) playerGoalCounts


aggregateScorers : List PlayerName -> Dict PlayerName Int
aggregateScorers playerNames =
    List.foldl updateGoalCountForPlayer Dict.empty playerNames


removeInsignificantPlayers : Int -> Dict PlayerName Int -> Dict PlayerName Int
removeInsignificantPlayers goalThreshold playerGoalCounts =
    Dict.filter (\_ v -> v >= goalThreshold) playerGoalCounts


resetPlayerGoalCount : PlayerName -> Dict PlayerName Int -> Dict PlayerName Int
resetPlayerGoalCount playerName playerGoalCounts =
    Dict.update playerName (Maybe.map (always 0)) playerGoalCounts


formatPlayer : PlayerName -> Dict PlayerName Int -> String
formatPlayer playerName playerGoalCounts =
    Dict.get playerName playerGoalCounts
        |> Maybe.map (\v -> playerName ++ ": " ++ String.fromInt v)
        |> Maybe.withDefault (playerName ++ ": 0")


formatPlayers : Dict PlayerName Int -> String
formatPlayers players =
    List.map (\p -> formatPlayer p players) (Dict.keys players)
        |> String.join ", "


combineGames : Dict PlayerName Int -> Dict PlayerName Int -> Dict PlayerName Int
combineGames game1 game2 =
    Dict.merge
        (\key a -> Dict.insert key a)
        (\key a b -> Dict.insert key (a + b))
        (\key b -> Dict.insert key b)
        game1
        game2
        Dict.empty
