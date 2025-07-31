module Luhn exposing (valid)


evenElems : List a -> List a
evenElems lst =
    case lst of
        e :: _ :: _ ->
            e :: (evenElems <| List.drop 2 lst)

        _ ->
            []


oddElems : List a -> List a
oddElems lst =
    case lst of
        _ :: e :: _ ->
            e :: (oddElems <| List.drop 2 lst)

        _ ->
            []


valid : String -> Bool
valid input =
    let
        clean =
            String.replace " " "" input

        asList =
            String.toList clean
                |> List.map (\c -> Char.toCode c - Char.toCode '0')
                |> List.reverse

        evens =
            evenElems asList

        doubleOdds =
            List.map
                (\n ->
                    if n * 2 > 9 then
                        n * 2 - 9

                    else
                        n * 2
                )
            <|
                oddElems asList

        sumAll =
            List.sum evens + List.sum doubleOdds
    in
    if String.any (not << Char.isDigit) clean || String.length clean < 2 then
        False

    else
        modBy 10 sumAll == 0
