module WordCount exposing (wordCount)

import Dict exposing (Dict)


countDict : Dict String Int -> List String -> Dict String Int
countDict d lst =
    case lst of
        [] ->
            d

        x :: xs ->
            let
                count =
                    Dict.get x d
                        |> Maybe.withDefault 0
                        |> (+) 1
            in
            countDict (Dict.insert x count d) xs


wordCount : String -> Dict String Int
wordCount sentence =
    let
        quoted s =
            if String.startsWith "'" s && String.endsWith "'" s then
                (String.dropLeft 1 << String.dropRight 1) s

            else
                s

        apostropheAlphaNum s =
            (s == '\'') || Char.isAlphaNum s
    in
    sentence
        |> String.toLower
        |> String.replace "," " "
        |> String.split " "
        |> List.map (String.filter apostropheAlphaNum)
        |> List.filter (not << String.isEmpty)
        |> List.map quoted
        |> countDict Dict.empty
