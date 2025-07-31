module SumOfMultiples exposing (sumOfMultiples)


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples divisors limit =
    let divisibleByAny ds n = List.filter (\d -> remainderBy d n == 0) ds
                              |> List.isEmpty >> not
    in List.filter (divisibleByAny divisors) (List.range 1 (limit - 1))
       |> List.sum

