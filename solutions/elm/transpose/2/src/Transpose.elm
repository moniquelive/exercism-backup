module Transpose exposing (transpose)


transp : List (List Char) -> List (List (Maybe Char))
transp lines =
    let
        tailWithDefault =
            List.tail >> Maybe.withDefault []
    in
    if List.all List.isEmpty lines then
        []

    else
        List.map List.head lines
            :: transp
                (List.map tailWithDefault lines)


trimRight : List (Maybe Char) -> List Char
trimRight =
    let
        dropWhile fn lst =
            case lst of
                [] ->
                    []

                x :: xs ->
                    if fn x then
                        dropWhile fn xs

                    else
                        x :: xs
    in
    List.reverse
        >> dropWhile ((==) Nothing)
        >> List.reverse
        >> List.map (Maybe.withDefault ' ')


transpose : List String -> List String
transpose lines =
    lines
        |> List.map String.toList
        |> transp
        |> List.map trimRight
        |> List.map String.fromList
