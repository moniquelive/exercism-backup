module PaolasPrestigiousPizza exposing
    ( Pizza
    , ingredientsParser
    , menuParser
    , oneIngredientParser
    , pizzaParser
    , priceParser
    , vegetarianParser
    , wordParser
    )

import Parser
    exposing
        ( (|.)
        , (|=)
        , Parser
        , Trailing(..)
        , andThen
        , chompWhile
        , end
        , getChompedString
        , int
        , keyword
        , map
        , oneOf
        , problem
        , sequence
        , spaces
        , succeed
        , symbol
        )


type alias Pizza =
    { name : String
    , vegetarian : Bool
    , ingredients : List String
    , price : Int
    }


priceParser : Parser Int
priceParser =
    succeed identity
        |= int
        |. symbol "€"


vegetarianParser : Parser Bool
vegetarianParser =
    oneOf
        [ map (\_ -> True) (keyword "(v)")
        , succeed False
        ]


wordParser : Parser String
wordParser =
    getChompedString (chompWhile Char.isAlpha)
        |> andThen (String.toLower >> succeed)


ingredientsParser : Parser (List String)
ingredientsParser =
    sequence
        { start = ""
        , separator = ","
        , end = ""
        , spaces = spaces
        , item = oneIngredientParser
        , trailing = Forbidden
        }
        |> andThen (List.filter (not << String.isEmpty) >> succeed)


pizzaParser : Parser Pizza
pizzaParser =
    succeed Pizza
        |= wordParser
        |. spaces
        |= vegetarianParser
        |. symbol ":"
        |. spaces
        |= ingredientsParser
        |. spaces
        |. symbol "-"
        |. spaces
        |= priceParser


menuParser : Parser (List Pizza)
menuParser =
    sequence
        { start = ""
        , separator = ""
        , end = ""
        , spaces = chompWhile (\c -> c == '\n')
        , item = pizzaParser
        , trailing = Forbidden
        }
        |. end


oneIngredientParser : Parser String
oneIngredientParser =
    succeed identity
        |= getChompedString (chompWhile (\c -> Char.isAlpha c || c == ' '))
        |> andThen checkString


checkString : String -> Parser String
checkString s =
    let
        groomed =
            s |> String.toLower >> String.trim
    in
    if String.isEmpty groomed then
        problem "empty string"

    else
        succeed groomed
