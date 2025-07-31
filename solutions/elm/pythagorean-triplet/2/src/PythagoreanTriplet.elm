module PythagoreanTriplet exposing (triplets)


type alias Triplet =
    ( Int, Int, Int )


triplets : Int -> List Triplet
triplets n =
    let
        flt a b =
            let
                c =
                    n - a - b
            in
            if a ^ 2 + b ^ 2 == c ^ 2 then
                Just ( a, b, c )

            else
                Nothing
    in
    List.range 3 (n // 3)
        |> List.concatMap
            (\a ->
                let
                    from =
                        a + 1

                    to =
                        (n - from) // 2
                in
                List.range from to |> List.filterMap (flt a)
            )
