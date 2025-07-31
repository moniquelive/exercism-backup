module GuessingGame (reply) where

reply :: Int -> String
reply 42 = "Correct"
reply 41 = "So close"
reply 43 = "So close"
reply guess
  | guess < 41 = "Too low"
  | guess > 43 = "Too high"
reply _ = error "huh?"
