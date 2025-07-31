module IsbnVerifier (isbn) where

import Data.Map (Map, fromList, keys, (!))

m :: Map Char Int
m =
  fromList
    [ ('0', 0),
      ('1', 1),
      ('2', 2),
      ('3', 3),
      ('4', 4),
      ('5', 5),
      ('6', 6),
      ('7', 7),
      ('8', 8),
      ('9', 9),
      ('X', 10)
    ]

isbn :: String -> Bool
isbn str = all ((== True) . ($ clean)) [c1, c2, c3]
  where
    clean = filter (`elem` keys m) str
    c1 = (== 10) . length
    c2 c = any ((== True) . ($ c)) [(== 'X') . last, notElem 'X']
    c3 =
      (== 0)
        . (`mod` 11)
        . sum
        . zipWith (*) [10, 9 .. 1]
        . map (m !)
