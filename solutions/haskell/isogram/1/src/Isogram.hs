module Isogram (isIsogram) where

import Data.Char
import qualified Data.Map as M

m :: M.Map Char Int
m = M.fromList (zip "abcdefghijklmnopqrstuvwxyz" (repeat 0))

maxElems :: M.Map k Int -> Int
maxElems = maximum . M.elems

sanitize :: [Char] -> [Char]
sanitize = filter isAlpha . map toLower

isIsogram :: String -> Bool
isIsogram xs = (maxElems . foldr (M.adjust succ) m $ sanitize xs) < 2
