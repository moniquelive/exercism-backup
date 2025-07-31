module Isogram exposing (isIsogram)

import Set


isIsogram : String -> Bool
isIsogram sentence =
    let
        alpha =
            String.filter Char.isAlpha sentence
                |> String.map Char.toLower
                |> String.toList

        set =
            Set.fromList alpha
    in
    List.length alpha == Set.size set
