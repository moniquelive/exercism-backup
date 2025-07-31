module RolePlayingGame exposing (Player, castSpell, introduce, revive)


type alias Player =
    { name : Maybe String
    , level : Int
    , health : Int
    , mana : Maybe Int
    }


introduce : Player -> String
introduce { name } =
    case name of
        Nothing ->
            "Mighty Magician"

        Just n ->
            n


revive : Player -> Maybe Player
revive player =
    if player.health == 0 then
        if player.level >= 10 then
            Just { player | health = 100, mana = Just 100 }

        else
            Just { player | health = 100 }

    else
        Nothing


castSpell : Int -> Player -> ( Player, Int )
castSpell manaCost player =
    case player.mana of
        Nothing ->
            ( { player | health = max 0 (player.health - manaCost) }, 0 )

        Just m ->
            if manaCost > m then
                ( player, 0 )

            else
                ( { player | mana = Just <| m - manaCost }, 2 * manaCost )
