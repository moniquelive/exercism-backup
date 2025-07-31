module BlorkemonCards exposing
    ( Card
    , compareShinyPower
    , expectedWinner
    , isMorePowerful
    , maxPower
    , sortByCoolness
    , sortByMonsterName
    )


type alias Card =
    { monster : String, power : Int, shiny : Bool }


isMorePowerful : Card -> Card -> Bool
isMorePowerful card1 card2 =
    card1.power > card2.power


maxPower : Card -> Card -> Int
maxPower card1 card2 =
    max card1.power card2.power


sortByMonsterName : List Card -> List Card
sortByMonsterName cards =
    List.sortBy .monster cards


sortByCoolness : List Card -> List Card
sortByCoolness cards =
    List.sortWith compareCoolness cards


compareShinyPower : Card -> Card -> Order
compareShinyPower card1 card2 =
    case compare card1.power card2.power of
        EQ ->
            case ( card1.shiny, card2.shiny ) of
                ( True, True ) ->
                    EQ

                ( False, False ) ->
                    EQ

                ( True, _ ) ->
                    GT

                _ ->
                    LT

        default ->
            default


expectedWinner : Card -> Card -> String
expectedWinner card1 card2 =
    case compareShinyPower card1 card2 of
        GT ->
            card1.monster

        LT ->
            card2.monster

        EQ ->
            "too close to call"


compareCoolness : Card -> Card -> Order
compareCoolness c1 c2 =
    case ( c1.shiny, c2.shiny ) of
        ( True, True ) ->
            compare c2.power c1.power

        ( False, False ) ->
            compare c2.power c1.power

        ( True, False ) ->
            LT

        ( False, True ) ->
            GT
