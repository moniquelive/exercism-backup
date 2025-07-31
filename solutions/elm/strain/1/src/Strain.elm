module Strain exposing (discard, keep)


keep : (a -> Bool) -> List a -> List a
keep predicate list =
    case list of
        [] ->
            []

        l :: ls ->
            if predicate l then
                l :: keep predicate ls

            else
                keep predicate ls


discard : (a -> Bool) -> List a -> List a
discard predicate list =
    keep (not << predicate) list
