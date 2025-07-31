module Accumulate exposing (accumulate)

accumulate : (a -> b) -> List a -> List b
accumulate func list = accumulateHelp func list []

accumulateHelp : (a -> b) -> List a -> List b -> List b
accumulateHelp func list result =
    case list of
        [] -> result
        (l :: ls) -> accumulateHelp func ls (result ++ [func l])

