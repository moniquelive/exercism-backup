defmodule PopCount do
  import Bitwise

  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
  def egg_count(0), do: 0
  def egg_count(number) when band(number, 1) == 1, do: egg_count(number >>> 1) + 1
  def egg_count(number), do: egg_count(number >>> 1)
end
