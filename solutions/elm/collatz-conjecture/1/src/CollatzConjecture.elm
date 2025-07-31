module CollatzConjecture exposing (collatz)


even : Int -> Bool
even n =
    remainderBy 2 n == 0


collatz : Int -> Result String Int
collatz start =
    let
        go steps n =
            if n <= 1 then
                steps

            else if even n then
                go (steps + 1) (n // 2)

            else
                go (steps + 1) (3 * n + 1)
    in
    if start <= 0 then
        Err "Only positive numbers are allowed"

    else
        Ok (go 0 start)
