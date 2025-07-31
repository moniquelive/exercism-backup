module Clock (addDelta, fromHourMin, toString) where

import Text.Printf (printf)

data Clock = Clock { hour :: Int
                   , minute :: Int
                   } deriving (Eq)

fromHourMin :: Int -> Int -> Clock
fromHourMin h m = Clock ((h + m `div` 60) `mod` 24) (m `mod` 60)

toString :: Clock -> String
toString c = printf "%02d:%02d" (hour c) (minute c)

addDelta :: Int -> Int -> Clock -> Clock
addDelta h m c = fromHourMin (hour c + h) (minute c + m)

