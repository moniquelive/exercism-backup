module Accumulate exposing (accumulate)


accumulate : (a -> b) -> List a -> List b
accumulate func list =
    accumulateHelp func list [] |> List.reverse


accumulateHelp : (a -> b) -> List a -> List b -> List b
accumulateHelp func list result =
    case list of
        [] ->
            result

        first :: rest ->
            accumulateHelp func rest (func first :: result)
