module TisburyTreasureHunt exposing (..)


type alias TreasureLocation =
    ( Int, Char )


type alias Treasure =
    ( String, TreasureLocation )


type alias PlaceLocation =
    ( Char, Int )


type alias Place =
    ( String, PlaceLocation )


placeLocationToTreasureLocation : PlaceLocation -> TreasureLocation
placeLocationToTreasureLocation placeLocation =
    ( Tuple.second placeLocation, Tuple.first placeLocation )


treasureLocationMatchesPlaceLocation : PlaceLocation -> TreasureLocation -> Bool
treasureLocationMatchesPlaceLocation placeLocation treasureLocation =
    let
        pf =
            Tuple.first placeLocation

        ps =
            Tuple.second placeLocation

        tf =
            Tuple.first treasureLocation

        ts =
            Tuple.second treasureLocation
    in
    pf == ts && ps == tf


countPlaceTreasures : Place -> List Treasure -> Int
countPlaceTreasures place treasures =
    let
        placeLoc =
            Tuple.second place

        treasureLocs =
            List.map Tuple.second treasures
    in
    List.filter (treasureLocationMatchesPlaceLocation placeLoc) treasureLocs
        |> List.length


specialCaseSwapPossible : ( String, TreasureLocation ) -> ( String, PlaceLocation ) -> ( String, TreasureLocation ) -> Bool
specialCaseSwapPossible ( foundTreasure, _ ) ( place, _ ) ( desiredTreasure, _ ) =
    case foundTreasure of
        "Brass Spyglass" ->
            True

        "Amethyst Octopus" ->
            case desiredTreasure of
                "Crystal Crab" ->
                    True

                "Glass Starfish" ->
                    place == "Stormy Breakwater"

                _ ->
                    False

        "Vintage Pirate Hat" ->
            case desiredTreasure of
                "Model Ship in Large Bottle" ->
                    place == "Harbor Managers Office"

                "Antique Glass Fishnet Float" ->
                    place == "Harbor Managers Office"

                _ ->
                    False

        _ ->
            False
