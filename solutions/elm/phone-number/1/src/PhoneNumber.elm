module PhoneNumber exposing (getNumber)


removeCountry : String -> String
removeCountry phone =
    if String.startsWith "+1" phone then
        String.dropLeft 2 phone

    else if String.startsWith "1" phone then
        String.dropLeft 1 phone

    else
        phone


validate : String -> Maybe String
validate phone =
    let
        firstDigit =
            String.slice 0 1 phone
                |> String.toInt
                |> Maybe.withDefault 0

        fourthDigit =
            String.slice 3 4 phone
                |> String.toInt
                |> Maybe.withDefault 0
    in
    if String.length phone /= 10 || firstDigit < 2 || fourthDigit < 2 then
        Nothing

    else
        Just phone


getNumber : String -> Maybe String
getNumber phoneNumber =
    removeCountry phoneNumber
        |> String.filter Char.isDigit
        |> validate
