module Luhn exposing (valid)


valid : String -> Bool
valid input =
    let
        clean =
            String.replace " " "" input

        asList =
            String.toList clean
                |> List.map (\c -> Char.toCode c - Char.toCode '0')
                |> List.reverse

        digits =
            List.indexedMap
                (\i n ->
                    if modBy 2 i /= 0 then
                        if n * 2 > 9 then
                            n * 2 - 9

                        else
                            n * 2

                    else
                        n
                )
                asList

        sumAll =
            List.sum digits
    in
    if String.any (not << Char.isDigit) clean || String.length clean < 2 then
        False

    else
        modBy 10 sumAll == 0
