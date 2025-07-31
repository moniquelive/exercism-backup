module BinarySearch exposing (find)

import Array exposing (Array)


bin : Int -> Array Int -> Int -> Int -> Maybe Int
bin n xs min max =
    let
        middle =
            (max + min) // 2
    in
    Array.get middle xs
        |> Maybe.andThen
            (\m ->
                if max == min then
                    Nothing

                else if n == m then
                    Just middle

                else if n < m then
                    bin n xs min middle

                else if n > m then
                    bin n xs (middle + 1) max

                else
                    Nothing
            )


find : Int -> Array Int -> Maybe Int
find target xs =
    bin target xs 0 (Array.length xs)
