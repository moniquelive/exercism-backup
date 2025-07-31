module CircularBuffer exposing (CircularBuffer, clear, new, overwrite, read, write)

import Array as A


type CircularBuffer a
    = CB ( Int, A.Array a )


new : Int -> CircularBuffer a
new size =
    CB ( size, A.empty )


write : a -> CircularBuffer a -> Maybe (CircularBuffer a)
write element (CB ( sz, arr )) =
    if A.length arr == sz then
        Nothing

    else
        Just <| CB ( sz, A.push element arr )


overwrite : a -> CircularBuffer a -> CircularBuffer a
overwrite element (CB ( sz, arr )) =
    if A.length arr == sz then
        CB ( sz, arr |> (A.push element << A.slice 1 sz) )

    else
        CB ( sz, arr |> A.push element )


read : CircularBuffer a -> Maybe ( a, CircularBuffer a )
read (CB ( sz, arr )) =
    A.get 0 arr
        |> Maybe.map (\el -> ( el, CB ( sz, A.slice 1 sz arr ) ))


clear : CircularBuffer a -> CircularBuffer a
clear (CB ( sz, _ )) =
    new sz
