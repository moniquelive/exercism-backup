module TwelveDays (recite) where

recite :: Int -> Int -> [String]
recite start stop =
  map sentence [start .. stop]

sentence :: Int -> String
sentence n =
  "On the " ++ ordinals n ++ " day of Christmas my true love gave to me: "
    ++ gifts n
    ++ "."

ordinals :: Int -> String
ordinals nth =
  ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eighth", "ninth", "tenth", "eleventh", "twelfth"]
    !! (nth - 1)

gifts :: Int -> String
gifts n = concatMap withCommas allButLast ++ optionalAnd ++ lastGift
  where
    withCommas = flip (++) ", "
    optionalAnd = if n > 1 then "and " else ""
    lastGift = last myGifts
    allButLast = init myGifts
    myGifts = (reverse . take n) ["a Partridge in a Pear Tree", "two Turtle Doves", "three French Hens", "four Calling Birds", "five Gold Rings", "six Geese-a-Laying", "seven Swans-a-Swimming", "eight Maids-a-Milking", "nine Ladies Dancing", "ten Lords-a-Leaping", "eleven Pipers Piping", "twelve Drummers Drumming"]
