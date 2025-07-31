module PythagoreanTriplet exposing (triplets)


type alias Triplet =
    ( Int, Int, Int )


triplets : Int -> List Triplet
triplets n =
    let
        flt a =
            let
                bPlusC =
                    n - a

                b =
                    (bPlusC ^ 2 - a ^ 2) // (2 * bPlusC)

                c =
                    n - a - b
            in
            if a < b && a ^ 2 + b ^ 2 == c ^ 2 then
                Just ( a, b, c )

            else
                Nothing
    in
    List.range 3 (n // 3) |> List.filterMap flt
