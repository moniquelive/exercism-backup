module Go exposing (..)

import GoSupport exposing (..)


applyRules : Game -> Rule -> NonValidatingRule -> Rule -> Rule -> Game
applyRules game oneStonePerPointRule captureRule libertyRule koRule =
    game
        |> changePlayer
        |> oneStonePerPointRule
        |> Result.andThen libertyRule
        |> Result.andThen koRule
        |> keepError game captureRule


keepError : Game -> NonValidatingRule -> Result String Game -> Game
keepError original captureRule result =
    case result of
        Ok g ->
            captureRule g

        Err error ->
            { original | error = error }
