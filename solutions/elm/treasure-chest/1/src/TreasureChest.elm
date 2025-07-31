module TreasureChest exposing (..)


type TreasureChest a
    = TreasureChest String a


getTreasure : String -> TreasureChest a -> Maybe a
getTreasure passwordAttempt (TreasureChest password treasure) =
    if passwordAttempt == password then
        Just treasure

    else
        Nothing


multiplyTreasure : (a -> b) -> TreasureChest a -> TreasureChest b
multiplyTreasure multiplier (TreasureChest password treasure) =
    TreasureChest password (multiplier treasure)
