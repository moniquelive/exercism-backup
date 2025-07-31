module Hamming exposing (distance)


zip : List a -> List b -> List (a, b)
zip = List.map2 Tuple.pair

distance : String -> String -> Result String Int
distance left right =
    if String.length left /= String.length right
    then (Err "left and right strands must be of equal length")
    else let ll = String.toList left
             rl = String.toList right
             r = zip ll rl
                    |> List.filter (\(a,b) -> a /= b )
                    |> List.length
         in (Ok r)
