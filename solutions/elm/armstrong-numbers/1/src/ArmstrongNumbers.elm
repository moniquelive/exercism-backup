module ArmstrongNumbers exposing (isArmstrongNumber)


isArmstrongNumber : Int -> Bool
isArmstrongNumber nb =
    let
        s =
            String.fromInt nb

        n =
            String.length s
    in
    s
        |> String.toList
        |> List.map (\d -> (Char.toCode d) - 48)
        |> List.map (\d -> d ^ n)
        |> List.sum
        |> (==) nb
