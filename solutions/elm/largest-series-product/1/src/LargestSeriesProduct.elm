module LargestSeriesProduct exposing (largestProduct)


chunksOf : Int -> String -> List String
chunksOf n s =
    if String.length s <= n then
        [ s ]

    else
        String.left n s :: chunksOf n (String.dropLeft 1 s)


largestProduct : Int -> String -> Maybe Int
largestProduct length series =
    if
        (length > String.length series)
            || (not << String.all Char.isDigit) series
            || (length < 0)
    then
        Nothing

    else
        let
            chunks =
                chunksOf length series
        in
        chunks
            |> List.map (String.split "" >> List.map (String.toInt >> Maybe.withDefault 0))
            |> List.map List.product
            |> List.maximum
