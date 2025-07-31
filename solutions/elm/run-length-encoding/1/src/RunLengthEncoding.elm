module RunLengthEncoding exposing (decode, encode)


takeWhile : (Char -> Bool) -> String -> String
takeWhile fn str =
    case String.uncons str of
        Nothing ->
            ""

        Just ( x, xs ) ->
            if fn x then
                String.fromChar x ++ takeWhile fn xs

            else
                ""


encode : String -> String
encode string =
    case String.uncons string of
        Nothing ->
            ""

        Just ( x, xs ) ->
            let
                prefix =
                    takeWhile ((==) x) xs

                count =
                    1 + String.length prefix

                header =
                    if count > 1 then
                        String.fromInt count

                    else
                        ""
            in
            header
                ++ String.fromChar x
                ++ (String.dropLeft count string |> encode)


decode : String -> String
decode string =
    if String.isEmpty string then
        ""

    else
        let
            prefix =
                takeWhile Char.isDigit string

            count =
                String.toInt prefix |> Maybe.withDefault 0

            prefixLen =
                String.length prefix

            header =
                if prefixLen > 0 then
                    String.dropLeft prefixLen string
                        |> String.left 1
                        |> String.repeat count

                else
                    String.left 1 string
        in
        header
            ++ (String.dropLeft (prefixLen + 1) string |> decode)
