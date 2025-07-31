module Brackets (arePaired) where

arePaired :: String -> Bool
arePaired = go []
 where
  go :: [Char] -> String -> Bool
  go stack [] = null stack
  go stack (c : cs)
    | c == '(' = go (')' : stack) cs
    | c == '[' = go (']' : stack) cs
    | c == '{' = go ('}' : stack) cs
    | c `elem` ")]}" = case stack of
        (x : xs) | x == c -> go xs cs
        _ -> False
    | otherwise = go stack cs
