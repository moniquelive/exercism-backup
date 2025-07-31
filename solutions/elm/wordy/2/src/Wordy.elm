module Wordy exposing (answer)

import Parser exposing (..)


answer : String -> Maybe Int
answer expr =
    run parser expr
        -- |> Debug.log expr
        |> Result.map evaluate
        |> Result.toMaybe


type Expr
    = Integer Int
    | Add Expr Expr
    | Sub Expr Expr
    | Mul Expr Expr
    | Div Expr Expr


evaluate : Expr -> Int
evaluate expr =
    case expr of
        Integer n ->
            n

        Add a b ->
            evaluate a + evaluate b

        Sub a b ->
            evaluate a - evaluate b

        Mul a b ->
            evaluate a * evaluate b

        Div a b ->
            evaluate a // evaluate b


signedInt : Parser Expr
signedInt =
    oneOf
        [ succeed Integer
            |. symbol "-"
            |= map negate int
        , map Integer int
        ]


term : Parser Expr
term =
    oneOf
        [ signedInt
        , succeed identity
            |. symbol "What is "
            |= lazy (\_ -> parser)
            |. symbol "?"
            |. end
        ]


parser : Parser Expr
parser =
    term |> andThen (expressionHelp [])


expressionHelp : List ( Expr, Op ) -> Expr -> Parser Expr
expressionHelp revOps expr =
    oneOf
        [ succeed Tuple.pair
            |. spaces
            |= operator
            |. spaces
            |= term
            |> andThen (\( op, newExpr ) -> expressionHelp (( expr, op ) :: revOps) newExpr)
        , lazy (\_ -> succeed (finalize revOps expr))
        ]


type Op
    = AddOp
    | SubOp
    | MulOp
    | DivOp


operator : Parser Op
operator =
    oneOf
        [ map (\_ -> AddOp) (symbol "plus")
        , map (\_ -> SubOp) (symbol "minus")
        , map (\_ -> MulOp) (symbol "multiplied by")
        , map (\_ -> DivOp) (symbol "divided by")
        ]


finalize : List ( Expr, Op ) -> Expr -> Expr
finalize revOps finalExpr =
    case revOps of
        [] ->
            finalExpr

        ( expr, DivOp ) :: otherRevOps ->
            -- finalize otherRevOps (Div expr finalExpr)
            Div (finalize otherRevOps expr) finalExpr

        ( expr, MulOp ) :: otherRevOps ->
            -- finalize otherRevOps (Mul expr finalExpr)
            Mul (finalize otherRevOps expr) finalExpr

        ( expr, SubOp ) :: otherRevOps ->
            Sub (finalize otherRevOps expr) finalExpr

        ( expr, AddOp ) :: otherRevOps ->
            Add (finalize otherRevOps expr) finalExpr
