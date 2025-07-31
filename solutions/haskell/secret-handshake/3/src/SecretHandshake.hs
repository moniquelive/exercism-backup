module SecretHandshake (handshake) where

handshake :: Int -> [String]
handshake n
  | n >= 16 = reverse . handshake $ n - 16
  | otherwise = go n ["wink", "double blink", "close your eyes", "jump"]
  where
    go n' events
      | n' == 0 = []
      | odd n' = head events : go (n' `div` 2) (tail events)
      | otherwise = go (n' `div` 2) (tail events)
