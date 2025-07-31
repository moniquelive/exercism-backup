module Allergies exposing (Allergy(..), isAllergicTo, toList)

import Bitwise exposing (..)
import Dict exposing (Dict)


type Allergy
    = Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate
    | Pollen
    | Cats


dict : Dict number Allergy
dict =
    Dict.fromList
        [ ( 1, Eggs )
        , ( 2, Peanuts )
        , ( 4, Shellfish )
        , ( 8, Strawberries )
        , ( 16, Tomatoes )
        , ( 32, Chocolate )
        , ( 64, Pollen )
        , ( 128, Cats )
        ]


toInt : Allergy -> Int
toInt a =
    case a of
        Eggs ->
            shiftLeftBy 0 1

        Peanuts ->
            shiftLeftBy 1 1

        Shellfish ->
            shiftLeftBy 2 1

        Strawberries ->
            shiftLeftBy 3 1

        Tomatoes ->
            shiftLeftBy 4 1

        Chocolate ->
            shiftLeftBy 5 1

        Pollen ->
            shiftLeftBy 6 1

        Cats ->
            shiftLeftBy 7 1


fromInt : Int -> Maybe Allergy
fromInt n =
    Dict.get n dict


isAllergicTo : Allergy -> Int -> Bool
isAllergicTo allergy score =
    let
        mask =
            toInt allergy
    in
    and score mask == mask


toList : Int -> List Allergy
toList score =
    let
        largestMask =
            toInt Cats

        aux s mask =
            if s == 0 || mask > largestMask then
                []

            else if and s 1 == 1 then
                fromInt mask :: aux (shiftRightBy 1 s) (shiftLeftBy 1 mask)

            else
                aux (shiftRightBy 1 s) (shiftLeftBy 1 mask)
    in
    aux score 1 |> List.filterMap identity
