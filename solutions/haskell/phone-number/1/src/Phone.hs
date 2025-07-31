module Phone (number) where

onlyNumbers :: String -> String
onlyNumbers = filter (`elem` ['0' .. '9'])

removeCountryCode :: String -> String
removeCountryCode ('1' : xs) = xs
removeCountryCode xs = xs

number :: String -> Maybe String
number xs
  | length norm /= 10 = Nothing
  | head norm `elem` "01" = Nothing -- area code
  | norm !! 3 `elem` "01" = Nothing -- exchange code
  | otherwise = Just norm
  where
    norm = removeCountryCode . onlyNumbers $ xs
