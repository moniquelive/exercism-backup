module Etl exposing (transform)

import Dict exposing (Dict)


convert : ( Int, List String ) -> List ( String, Int )
convert ( k, v ) =
    List.map (\s -> ( String.toLower s, k )) v


transform : Dict Int (List String) -> Dict String Int
transform input =
    Dict.toList input
        |> List.concatMap convert
        |> Dict.fromList
