module Anagram exposing (detect)


detect : String -> List String -> List String
detect word =
    let
        lower =
            String.toLower

        sorted =
            lower
                >> String.split ""
                >> List.sort
                >> String.join ""
    in
    List.filter (\c -> sorted c == sorted word && lower c /= lower word)
