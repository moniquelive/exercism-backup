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
            1

        Peanuts ->
            2

        Shellfish ->
            4

        Strawberries ->
            8

        Tomatoes ->
            16

        Chocolate ->
            32

        Pollen ->
            64

        Cats ->
            128


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
