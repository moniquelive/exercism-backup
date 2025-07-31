module ETL (transform) where

import qualified Data.Char as C
import qualified Data.Map as M

transform :: M.Map a String -> M.Map Char a
transform = M.fromList . foldl conv [] . M.toList
  where
    conv acc (k, v) =
      let ks = map C.toLower v
          vs = repeat k
       in zip ks vs ++ acc
