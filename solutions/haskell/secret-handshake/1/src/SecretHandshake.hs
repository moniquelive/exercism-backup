module SecretHandshake (handshake) where

events :: [String]
events = ["wink", "double blink", "close your eyes", "jump"]

toBin :: Int -> [Int]
toBin 0 = [0]
toBin 1 = [1]
toBin n
  | even n = toBin (n `div` 2) ++ [0]
  | otherwise = toBin (n `div` 2) ++ [1]

handshake :: Int -> [String]
handshake n
  | n >= 16 = reverse . handshake $ n - 16
  | otherwise =
    map ((events !!) . snd) . filter ((== 1) . fst) $ zip reversedBin indices
  where
    reversedBin = reverse . toBin $ n
    indices = [0 ..]
