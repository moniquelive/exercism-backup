module Yacht

type Category = 
    | Ones
    | Twos
    | Threes
    | Fours
    | Fives
    | Sixes
    | FullHouse
    | FourOfAKind
    | LittleStraight
    | BigStraight
    | Choice
    | Yacht

type Die =
    | One 
    | Two 
    | Three
    | Four 
    | Five 
    | Six

let score category dice =
    let dieToInt = function
        | One -> 1
        | Two -> 2
        | Three -> 3
        | Four -> 4
        | Five -> 5
        | Six -> 6

    let sortedDice = dice |> List.map dieToInt |> List.sort
    let groups = sortedDice |> List.groupBy id |> List.sortBy (snd >> List.length)
    let count x = dice |> List.filter ((=) x) |> List.length

    match category with
    | Ones -> 1 * count One
    | Twos -> 2 * count Two
    | Threes -> 3 * count Three
    | Fours -> 4 * count Four
    | Fives -> 5 * count Five
    | Sixes -> 6 * count Six
    | FullHouse ->
        match groups with
        | [_; (_, threes)] when threes.Length = 3 -> List.sum sortedDice
        | _ -> 0
    | FourOfAKind ->
        match groups with
        | [(value, four)] -> 4 * value
        | [_; (value, four)] when four.Length >= 4 -> 4 * value
        | _ -> 0
    | LittleStraight -> if sortedDice = [1..5] then 30 else 0
    | BigStraight ->    if sortedDice = [2..6] then 30 else 0
    | Choice ->         List.sum sortedDice
    | Yacht ->          if groups.Length = 1 then 50 else 0