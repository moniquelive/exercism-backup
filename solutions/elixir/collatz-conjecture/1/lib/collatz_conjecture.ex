defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input),
    do: count(input, 0)

  def count(1, steps), do: steps

  def count(n, steps) when rem(n, 2) == 1,
    do: count(3 * n + 1, steps + 1)

  def count(n, steps) when n > 0 and rem(n, 2) == 0,
    do: count(div(n, 2), steps + 1)
end
