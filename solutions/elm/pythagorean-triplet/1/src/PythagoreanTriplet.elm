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
    List.concatMap
        (\a ->
            let
                l1 =
                    a + 1

                u1 =
                    (n - l1) // 2
            in
            List.filterMap (flt a) (List.range l1 u1)
        )
        (List.range 1 (n // 3))
