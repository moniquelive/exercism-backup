module Acronym exposing (abbreviate)


abbreviate : String -> String
abbreviate phrase =
    String.replace "-" " " phrase
        |> String.split " "
        |> List.map (String.left 1)
        |> String.join ""
        |> String.toUpper
