module LeapYear (isLeapYear) where

--- on every year that is evenly divisible by 4
---   except every year that is evenly divisible by 100
---     unless the year is also evenly divisible by 400

isLeapYear :: Integer -> Bool
isLeapYear year
  | divisible_by year 400 = True
  | divisible_by year 100 = False
  | divisible_by year 4 = True
  | otherwise = False
 where
  divisible_by a b = (== 0) (mod a b)
