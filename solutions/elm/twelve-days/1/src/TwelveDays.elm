module TwelveDays exposing (recite)

recite : Int -> Int -> List String
recite start stop = List.range start stop |> List.map line

line : Int -> String
line n = let ordinals = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]
             gifts = ["a Partridge in a Pear Tree", "two Turtle Doves, and", "three French Hens,", "four Calling Birds,", "five Gold Rings,", "six Geese-a-Laying,", "seven Swans-a-Swimming,", "eight Maids-a-Milking,", "nine Ladies Dancing,", "ten Lords-a-Leaping,", "eleven Pipers Piping,", "twelve Drummers Drumming," ]
         in "On the " ++ (List.drop (n - 1) ordinals |> List.head |> Maybe.withDefault "") ++
            " day of Christmas my true love gave to me: " ++
            (List.take n gifts |> List.reverse |> String.join " ") ++ "."

