module LeapYear (isLeapYear) where

--- on every year that is evenly divisible by 4
---   except every year that is evenly divisible by 100
---     unless the year is also evenly divisible by 400

isLeapYear :: Integer -> Bool
isLeapYear year = (year `rem` 4 == 0 && year `rem` 100 /= 0) ||
                   year `rem` 400 == 0
