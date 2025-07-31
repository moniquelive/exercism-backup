module DifferenceOfSquares exposing (difference, squareOfSum, sumOfSquares)


squareOfSum : Int -> Int
squareOfSum n =
    let
        s =
            List.sum (List.range 1 n)
    in
    s ^ 2


sumOfSquares : Int -> Int
sumOfSquares n =
    let
        sq =
            List.map (\x -> x ^ 2) (List.range 1 n)
    in
    List.sum sq


difference : Int -> Int
difference n =
    squareOfSum n - sumOfSquares n
