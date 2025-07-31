module Transpose exposing (transpose)


transp : List String -> List String
transp lines =
    if List.all String.isEmpty lines then
        []

    else
        (List.map (String.left 1) lines |> String.join "")
            :: transp
                (List.map (String.dropLeft 1) lines)


transpose : List String -> List String
transpose lines =
    let
        max =
            List.map String.length lines
                |> List.maximum
                |> Maybe.withDefault -1

        padded =
            List.map (String.padRight max ' ') lines

        transposed =
            transp padded

        droppedLast =
            transposed
                |> List.reverse
                |> List.drop 1
                |> List.reverse

        trimmedLastElem =
            transposed
                |> List.reverse
                |> List.head
                |> Maybe.map String.trimRight
    in
    case trimmedLastElem of
        Nothing ->
            []

        Just el ->
            droppedLast ++ [ el ]
