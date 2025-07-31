module SecretHandshake (handshake) where

handshake :: Int -> [String]
handshake n
  | n >= 16 = reverse . handshake $ n - 16
  | otherwise = [events !! i | i <- go n 0]
  where
    events = ["wink", "double blink", "close your eyes", "jump"]
    go nn i
      | nn == 0 = []
      | odd nn = i : go (nn `div` 2) (i + 1)
      | otherwise = go (nn `div` 2) (i + 1)
