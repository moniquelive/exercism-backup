module Pangram exposing (isPangram)


charRange : Char -> Char -> List Char
charRange from to =
    let f = Char.toCode from
        t = Char.toCode to
    in List.map Char.fromCode (List.range f t)

isPangram : String -> Bool
isPangram sentence =
    let lower = String.toLower sentence |> String.toList
        alpha = charRange 'a' 'z'
        member lst el = List.member el lst
    in List.all (member lower) alpha

