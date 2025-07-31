module Allergies exposing (Allergy(..), isAllergicTo, toList)

import Bitwise exposing (..)


type Allergy
    = Eggs
    | Peanuts
    | Shellfish
    | Strawberries
    | Tomatoes
    | Chocolate
    | Pollen
    | Cats


fromInt : Int -> Maybe Allergy
fromInt n =
    case n of
        1 ->
            Just Eggs

        2 ->
            Just Peanuts

        4 ->
            Just Shellfish

        8 ->
            Just Strawberries

        16 ->
            Just Tomatoes

        32 ->
            Just Chocolate

        64 ->
            Just Pollen

        128 ->
            Just Cats

        _ ->
            Nothing


isAllergicTo : Allergy -> Int -> Bool
isAllergicTo allergy score =
    case allergy of
        Eggs ->
            and score 1 == 1

        Peanuts ->
            and score 2 == 2

        Shellfish ->
            and score 4 == 4

        Strawberries ->
            and score 8 == 8

        Tomatoes ->
            and score 16 == 16

        Chocolate ->
            and score 32 == 32

        Pollen ->
            and score 64 == 64

        Cats ->
            and score 128 == 128


toList : Int -> List Allergy
toList score =
    let
        aux s mask =
            if s == 0 || mask > 128 then
                []

            else if and s 1 == 1 then
                (fromInt mask |> Maybe.withDefault Cats) :: aux (shiftRightBy 1 s) (shiftLeftBy 1 mask)

            else
                aux (shiftRightBy 1 s) (shiftLeftBy 1 mask)
    in
    aux score 1
