module TreasureFactory exposing (TreasureChest, getTreasure, makeChest, makeTreasureChest, secureChest, uniqueTreasures)


type TreasureChest treasure
    = TreasureChest String treasure


getTreasure : String -> TreasureChest a -> Maybe a
getTreasure passwordAttempt (TreasureChest password treasure) =
    if passwordAttempt == password then
        Just treasure

    else
        Nothing


type Chest treasure conds
    = Chest String treasure


makeChest : String -> treasure -> Chest treasure {}
makeChest password treasure =
    Chest password treasure


secureChest : Chest treasure conds -> Maybe (Chest treasure { conds | securePassword : () })
secureChest (Chest password treasure) =
    if String.length password >= 8 then
        Just (Chest password treasure)

    else
        Nothing


uniqueTreasures : List (Chest treasure conds) -> List (Chest treasure { conds | uniqueTreasures : () })
uniqueTreasures chests =
    let
        openChest (Chest _ treasure) =
            treasure

        treasures =
            chests |> List.map openChest

        single el lst =
            lst
                |> List.filter ((==) el)
                |> List.length
                |> (==) 1

        uniq (Chest password treasure) =
            if single treasure treasures then
                Just (Chest password treasure)

            else
                Nothing
    in
    List.filterMap uniq chests


makeTreasureChest : Chest treasure { conditions | securePassword : (), uniqueTreasures : () } -> TreasureChest treasure
makeTreasureChest (Chest password treasure) =
    TreasureChest password treasure
