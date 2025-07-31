module GottaSnatchEmAll exposing (..)

import Set exposing (Set)


type alias Card =
    String


newCollection : Card -> Set Card
newCollection card =
    Set.singleton card


addCard : Card -> Set Card -> ( Bool, Set Card )
addCard card collection =
    let
        new =
            Set.insert card collection
    in
    ( Set.size new == Set.size collection, new )


tradeCard : Card -> Card -> Set Card -> ( Bool, Set Card )
tradeCard yourCard theirCard collection =
    let
        possible =
            Set.member yourCard collection && not (Set.member theirCard collection)
    in
    ( possible, collection |> Set.remove yourCard |> Set.insert theirCard )


removeDuplicates : List Card -> List Card
removeDuplicates cards =
    cards |> Set.fromList |> Set.toList


extraCards : Set Card -> Set Card -> Int
extraCards yourCollection theirCollection =
    Set.diff yourCollection theirCollection |> Set.size


boringCards : List (Set Card) -> List Card
boringCards collection =
    let
        first =
            Maybe.withDefault Set.empty (List.head collection)

        rest =
            Maybe.withDefault [ Set.empty ] (List.tail collection)
    in
    List.foldr Set.intersect first rest |> Set.toList


totalCards : List (Set Card) -> Int
totalCards collections =
    List.foldr Set.union Set.empty collections |> Set.size


splitShinyCards : Set Card -> ( List Card, List Card )
splitShinyCards cards =
    Set.partition (String.startsWith "Shiny") cards |> Tuple.mapBoth Set.toList Set.toList
