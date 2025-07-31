module AllYourBase exposing (rebase)


toBase10 : Int -> List Int -> Maybe Int
toBase10 inBase digits =
    List.range 0 (List.length digits - 1)
        |> List.map ((^) inBase)
        |> List.reverse
        |> List.map2 (*) digits
        |> List.sum
        |> (\n ->
                if n <= 0 then
                    Nothing

                else
                    Just n
           )


toBase : Int -> Int -> List Int
toBase outBase n =
    if n == 0 then
        []

    else
        modBy outBase n :: toBase outBase (n // outBase)


rebase : Int -> List Int -> Int -> Maybe (List Int)
rebase inBase digits outBase =
    let
        invalidBases =
            outBase <= 0 || inBase <= 0

        outside from to n =
            from > n || n >= to

        invalidDigits =
            List.isEmpty digits
                || List.any (outside 0 inBase) digits
    in
    if invalidBases || invalidDigits then
        Nothing

    else
        toBase10 inBase digits
            |> Maybe.map (toBase outBase)
            |> Maybe.map List.reverse
