module Sublist exposing (ListComparison(..), sublist)


type ListComparison
    = Equal
    | Superlist
    | Sublist
    | Unequal


isSub : List a -> List a -> Bool
isSub a b =
    if List.length b < List.length a then
        False

    else
        case b of
            [] ->
                False

            _ :: xs ->
                if isEqual a (List.take (List.length a) b) then
                    True

                else
                    isSub a xs


isEqual : List a -> List a -> Bool
isEqual a b =
    let
        sameSize =
            List.length a == List.length b

        sameValues =
            List.map2 (==) a b
                |> List.all ((==) True)
    in
    sameSize && sameValues


sublist : List a -> List a -> ListComparison
sublist alist blist =
    if isEqual alist blist then
        Equal

    else if isSub blist alist then
        Superlist

    else if isSub alist blist then
        Sublist

    else
        Unequal
