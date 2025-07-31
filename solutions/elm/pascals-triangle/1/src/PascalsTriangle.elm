module PascalsTriangle exposing (rows)


rows : Int -> List (List Int)
rows nn =
    if nn <= 0 then
        []

    else
        let
            binom n k =
                List.product (List.range (1 + n - k) n)
                    // List.product (List.range 1 k)
        in
        rows (nn - 1)
            ++ [ List.map (\i -> binom (nn - 1) i) (List.range 0 (nn - 1)) ]
