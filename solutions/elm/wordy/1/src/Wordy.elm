module Wordy exposing (answer)


answer : String -> Maybe Int
answer =
    String.dropRight 1
        >> String.replace "plus" "+"
        >> String.replace "minus" "-"
        >> String.replace "multiplied by" "*"
        >> String.replace "divided by" "/"
        >> String.split " "
        >> List.drop 2
        >> eval


eval : List String -> Maybe Int
eval lst =
    case lst of
        a :: op :: b :: rest ->
            let
                partial =
                    case op of
                        "+" ->
                            Maybe.map2 (+) (String.toInt a) (String.toInt b)

                        "-" ->
                            Maybe.map2 (-) (String.toInt a) (String.toInt b)

                        "*" ->
                            Maybe.map2 (*) (String.toInt a) (String.toInt b)

                        "/" ->
                            Maybe.map2 (//) (String.toInt a) (String.toInt b)

                        _ ->
                            Nothing
            in
            partial
                |> Maybe.andThen (\p -> eval (String.fromInt p :: rest))

        _ :: _ :: _ ->
            Nothing

        a :: _ ->
            String.toInt a

        _ ->
            Nothing
