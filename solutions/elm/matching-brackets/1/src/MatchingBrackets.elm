module MatchingBrackets exposing (isPaired)


closingBrackets : Char -> Bool
closingBrackets x =
    List.member x [ '}', ']', ')' ]


openingBrackets : Char -> Bool
openingBrackets x =
    List.member x [ '{', '[', '(' ]


dontMatch : Char -> Char -> Bool
dontMatch a b =
    (a == '}' && b /= '{')
        || (a == ']' && b /= '[')
        || (a == ')' && b /= '(')


match : String -> List Char -> Bool
match string stack =
    case String.uncons string of
        Nothing ->
            List.isEmpty stack

        Just ( stringHead, stringTail ) ->
            let
                newStack =
                    case stack of
                        [] ->
                            if closingBrackets stringHead then
                                Nothing

                            else if openingBrackets stringHead then
                                -- push
                                Just (stringHead :: stack)

                            else
                                -- noop
                                Just stack

                        stackHead :: stackTail ->
                            if dontMatch stringHead stackHead then
                                Nothing

                            else if closingBrackets stringHead then
                                -- pop
                                Just stackTail

                            else if openingBrackets stringHead then
                                -- push
                                Just (stringHead :: stack)

                            else
                                -- noop
                                Just stack

                -- noop
            in
            case newStack of
                Nothing ->
                    False

                Just justStack ->
                    match stringTail justStack


isPaired : String -> Bool
isPaired input =
    match input []
