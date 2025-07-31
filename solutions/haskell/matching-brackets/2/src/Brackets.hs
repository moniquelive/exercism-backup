module Brackets (arePaired) where

import Control.Monad (foldM)

arePaired :: String -> Bool
arePaired = maybe False null . foldM step []
 where
  step :: [Char] -> Char -> Maybe String
  step stack c
    | c == '(' = Just (')' : stack)
    | c == '[' = Just (']' : stack)
    | c == '{' = Just ('}' : stack)
    | c `elem` ")]}" = case stack of
        (x : xs) | x == c -> Just xs
        _ -> Nothing
    | otherwise = Just stack
