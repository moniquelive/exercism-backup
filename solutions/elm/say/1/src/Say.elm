module Say exposing (SayError(..), say)


type SayError
    = Negative
    | TooLarge


units : List String
units =
    [ "zero"
    , "one"
    , "two"
    , "three"
    , "four"
    , "five"
    , "six"
    , "seven"
    , "eight"
    , "nine"
    , "ten"
    , "eleven"
    , "twelve"
    , "thirteen"
    , "fourteen"
    , "fifteen"
    , "sixteen"
    , "seventeen"
    , "eighteen"
    , "nineteen"
    ]


tens : List String
tens =
    [ ""
    , ""
    , "twenty"
    , "thirty"
    , "forty"
    , "fifty"
    , "sixty"
    , "seventy"
    , "eighty"
    , "ninety"
    ]


above : List String
above =
    [ ""
    , ""
    , " hundred"
    , " thousand"
    , ""
    , ""
    , " million"
    , ""
    , ""
    , " billion"
    ]


sayNumber : Int -> List String -> String
sayNumber number lst =
    List.drop number lst
        |> List.head
        |> Maybe.withDefault "not a number"


go : Int -> Int -> String
go number base =
    let
        ( div, mod ) =
            ( number // base, modBy base number )

        begin =
            if number < 100 then
                sayNumber div tens

            else
                speak div

        end =
            speak mod

        prefixLabel =
            sayNumber (logBase 10 (toFloat base) |> round) above
    in
    begin
        ++ prefixLabel
        ++ (if end == "zero" then
                ""

            else
                (if number < 100 then
                    "-"

                 else if mod < 100 then
                    " and "

                 else
                    " "
                )
                    ++ end
           )


speak : Int -> String
speak number =
    if number < 20 then
        sayNumber number units

    else if number < 100 then
        go number 10

    else if number < 1000 then
        go number 100

    else if number < 1000000 then
        go number 1000

    else if number < 1000000000 then
        go number 1000000

    else if number < 1000000000000 then
        go number 1000000000

    else
        "not a number"


say : Int -> Result SayError String
say number =
    if number < 0 then
        Err Negative

    else if number >= 999999999999 then
        Err TooLarge

    else
        Ok (speak number)
