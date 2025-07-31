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
        , token
        )


type alias Pizza =
    { name : String
    , vegetarian : Bool
    , ingredients : List String
    , price : Int
    }


priceParser : Parser Int
priceParser =
    int
        |. token "€"


vegetarianParser : Parser Bool
vegetarianParser =
    oneOf
        [ map (\_ -> True) (keyword "(v)")
        , succeed False
        ]


wordParser : Parser String
wordParser =
    getChompedString (chompWhile Char.isAlpha)
        |> map String.toLower


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


pizzaParser : Parser Pizza
pizzaParser =
    succeed Pizza
        |= wordParser
        |. spaces
        |= vegetarianParser
        |. token ":"
        |. spaces
        |= ingredientsParser
        |. spaces
        |. token "-"
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
    getChompedString (chompWhile (\c -> Char.isAlpha c || c == ' '))
        |> map (String.toLower >> String.trim)
        |> andThen checkString


checkString : String -> Parser String
checkString s =
    if String.isEmpty s then
        problem "empty string"

    else
        succeed s
