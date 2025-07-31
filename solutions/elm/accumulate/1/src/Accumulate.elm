module Accumulate exposing (accumulate)


accumulate : (a -> b) -> List a -> List b
accumulate func list =
    case list of
        [] -> []
        (l :: ls) -> func l :: accumulate func ls
