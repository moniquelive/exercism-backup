{-# LANGUAGE OverloadedStrings #-}

module WordProblem (answer) where

import qualified Data.Text as T
import Text.Read (readMaybe)

doOp :: Integer -> String -> Integer -> Integer
doOp x "+" y = x + y
doOp x "-" y = x - y
doOp x "*" y = x * y
doOp x "/" y = x `div` y
doOp _ op _ = error ("invalid op: " ++ op)

answer :: String -> Maybe Integer
answer = go . clean
  where
    go :: [String] -> Maybe Integer
    go [x] = readMaybe x
    go (x : op : y : rest)
      | (Just jx, Just jy) <- (readMaybe x, readMaybe y) =
        go (show (doOp jx op jy) : rest)
      | otherwise = Nothing
    go _ = Nothing

    clean =
      map T.unpack
        . T.words
        . T.replace "plus" "+"
        . T.replace "minus" "-"
        . T.replace "multiplied by" "*"
        . T.replace "divided by" "/"
        . T.replace "What is " ""
        . T.replace "?" ""
        . T.pack
