module Leap exposing (isLeapYear)


isLeapYear : Int -> Bool
isLeapYear year =
    let divBy4 = modBy 4 year == 0
        divBy100 = modBy 100 year == 0
        divBy400 = modBy 400 year == 0
    in divBy400 || (divBy4 && (not divBy100))

