module Series exposing (slices)


slices : Int -> String -> Result String (List (List Int))
slices size input =
    if String.isEmpty input then
        Err "series cannot be empty"

    else if size < 0 then
        Err "slice length cannot be negative"

    else if size == 0 then
        Err "slice length cannot be zero"

    else if size > String.length input then
        Err "slice length cannot be greater than series length"

    else
        let
            digits =
                String.split "" input
                    |> List.map (String.toInt >> Maybe.withDefault 0)

            combs lst =
                if List.length lst < size then
                    []

                else
                    List.take size lst
                        :: combs (List.drop 1 lst)
        in
        Ok <| combs digits
