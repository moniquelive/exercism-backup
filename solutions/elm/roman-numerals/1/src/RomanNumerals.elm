module RomanNumerals exposing (toRoman)


table : List ( number, String )
table =
    [ ( 1000, "M" )
    , ( 900, "CM" )
    , ( 500, "D" )
    , ( 400, "CD" )
    , ( 100, "C" )
    , ( 90, "XC" )
    , ( 50, "L" )
    , ( 40, "XL" )
    , ( 10, "X" )
    , ( 9, "IX" )
    , ( 5, "V" )
    , ( 4, "IV" )
    , ( 1, "I" )
    ]


toRoman : Int -> String
toRoman number =
    if number < 1 then
        ""

    else
        let
            ( a, b ) =
                List.filter (\( k, _ ) -> number >= k) table
                    |> List.head
                    |> Maybe.withDefault ( 0, "" )
        in
        b ++ toRoman (number - a)
