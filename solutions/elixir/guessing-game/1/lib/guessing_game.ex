defmodule GuessingGame do
  def compare(secret_number, guess \\ :no_guess) do
    cond do
      guess == :no_guess -> "Make a guess"
      guess in [secret_number + 1, secret_number - 1] -> "So close"
      guess > secret_number -> "Too high"
      guess < secret_number -> "Too low"
      true -> "Correct"
    end
  end
end
